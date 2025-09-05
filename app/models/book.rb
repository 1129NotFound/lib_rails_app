class Book < ApplicationRecord
  # 関連付け
  has_many :loans, dependent: :destroy
  has_many :users, through: :loans

  # バリデーション
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :category, presence: true
  validates :total_copies, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # 検索メソッド（F-5検索／フィルタ要件対応）
  def self.search(keyword, category)
    books = all
    if keyword.present?
      books = books.where("title LIKE :kw OR author LIKE :kw", kw: "%#{keyword}%")
    end
    if category.present?
      books = books.where(category: category)
    end
    books
  end

  # 貸出可能冊数（全体冊数から貸出中を差し引く）
  def available_copies
    total_copies - loans.where(returned_at: nil).count
  end

  # 貸出可能かどうか
  def available?
    available_copies > 0
  end
end

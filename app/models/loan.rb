class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_at, presence: true
  validates :due_at, presence: true

  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true   # ユーザーID（外部キー）
      t.references :book, null: false, foreign_key: true   # 書籍ID（外部キー）
      t.datetime :borrowed_at, null: false                  # 貸出日
      t.datetime :due_at, null: false                       # 返却予定日
      t.datetime :returned_at                               # 返却日

      t.timestamps
    end
  end


  # 返却済みかどうか
  def returned?
    returned_at.present?
  end

  # 延滞しているかどうか
  def overdue?
    !returned? && due_at < Date.today
  end
end
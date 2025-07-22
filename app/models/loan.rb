class Loan < ApplicationRecord
  belongs_to :user_id
  belongs_to :book

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
end

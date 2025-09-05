class User < ApplicationRecord
  validates :student_no, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, presence: true
  validates :password, presence: true

  def authenticate(plain_password)
    self.password == plain_password
  end
end
#     def change
#         create_table :users do |t|
#           t.string :student_no, null: false, unique: true  # 学籍番号
#           t.string :name, null: false                       # 名前
#           t.string :role                                      # 役職（例：学生、職員）
#           t.string :password                                  # パスワード（今回は平文）
    
#           t.timestamps
#         end
    
#         add_index :users, :student_no, unique: true  # 学籍番号にインデックスを追加
#       end
# end

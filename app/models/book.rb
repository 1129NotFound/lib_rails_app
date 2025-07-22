class Book < ApplicationRecord
<<<<<<< HEAD
    class Book < ApplicationRecord
        has_many :loans
        has_many :users, through: :loans
      
        validates :title, presence: true
        validates :author, presence: true
      end
      
=======
  def self.search(keyword, category)
    books = Book.all
    if keyword.present?
      books = books.where("title LIKE ? OR author LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
    if category.present?
      books = books.where(category: category)
    end
    books
  end
>>>>>>> 33cc43ff20fb874ff11f7d278c7a158fcc8f78d0
end

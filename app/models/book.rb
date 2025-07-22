class Book < ApplicationRecord
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
end

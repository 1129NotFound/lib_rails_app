class Book < ApplicationRecord
    class Book < ApplicationRecord
        has_many :loans
        has_many :users, through: :loans
      
        validates :title, presence: true
        validates :author, presence: true
      end
      
end

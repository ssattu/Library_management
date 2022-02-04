class Book < ApplicationRecord
	has_many :issue_books
	has_many :users, through: :issue_book
	 

	 mount_uploader :image, ImageUploader

end

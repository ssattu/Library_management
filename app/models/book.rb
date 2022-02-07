class Book < ApplicationRecord
	has_many :issue_books, dependent: :destroy
	has_many :users, through: :issue_books, dependent: :destroy
	 

	 mount_uploader :image, ImageUploader

end

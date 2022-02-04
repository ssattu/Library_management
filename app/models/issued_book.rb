class IssuedBook < ApplicationRecord
  belongs_to :issue_book
  belongs_to :user
  belongs_to :book
end

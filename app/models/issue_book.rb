class IssueBook < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :user, dependent: :destroy
end

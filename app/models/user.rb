class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :issue_books, dependent: :destroy
  has_many :books, through: :issue_books, dependent: :destroy
  

  validates :name, :contact, :email, :password, :password_confirmation, presence: true
  validates :name, length: { minimum: 3, too_short: true}, format: {with: /\A[A-Za-z]+\z/, message: "only letters are allowed"}
  validates :contact, length: {is: 10, message: "Only enter 10 digits" }, numericality: {message: "only numbers allowed"}
  
end

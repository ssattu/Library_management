Rails.application.routes.draw do
  get 'issue_books/new/:id', to: "issue_books#new", as: "issue_book"
  get 'issue_books/show/:id', to: "issue_books#show", as: "issue_book/show"
  delete 'issue_books/destroy/:id', to: "issue_books#destroy", as: "issue_book/return"

  root 'books#index'
  devise_for :users,  controllers: { sessions: 'users/sessions' }

  resources :books
  resources :issue_books
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

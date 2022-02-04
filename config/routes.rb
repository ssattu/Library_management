Rails.application.routes.draw do
  get 'issue_books/_form'
  get 'issue_books/index'
  get 'issue_books/new'
  get 'issue_books/create'
  get 'issue_books/edit'
  get 'issue_books/update'
  get 'issue_books/show'
  get 'issue_books/destroy'
  root 'books#index'
  devise_for :users,  controllers: { sessions: 'users/sessions' }

  
  resources :books
  resources :issue_books

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

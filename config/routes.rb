Rails.application.routes.draw do
  get "/" => "articles#index"
  get "articles/about" => "articles#about"
  get "articles/contact" => "articles#contact"

  get "articles/new" => "articles#new"

  get "articles/:id" => "articles#show"

  get "categories/index" => "categories#index"

  get "categories/new" => "categories#new"

  get "categories/:id" => "categories#show"


  post "articles/create" => "articles#create"
  post "categories/create" => "categories#create"



  resources :articles, :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  post "articles/:id/update" => "articles#update"
  get "articles/:id/edit" => "articles#edit"
  post "articles/create" => "articles#create"

  post "categories/:id/update" => "categories#update"
  get "categories/:id/edit" => "categories#edit"
  post "categories/create" => "categories#create"


  get "/" => "articles#index"
  get "articles/about" => "articles#about"
  get "articles/contact" => "articles#contact"

  get "articles/new" => "articles#new"
  get "articles/:id" => "articles#show"
  delete "articles/:id" => "articles#destroy"
  

  get "categories/index" => "categories#index"
  get "categories/new" => "categories#new"
  get "categories/:id" => "categories#show"
  

  resources :articles, :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

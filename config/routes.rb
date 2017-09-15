Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  post "/contacts" => "contacts#create"

  get "/contacts/:id" => "contacts#show"
  get "/contacts/:id/edit" => "contacts#edit"
  patch "/contacts/:id" => "contacts#update"
  delete "/contacts/:id" => "contacts#destroy"

  get "/contcats/johns" => "contacts#all_johns"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end

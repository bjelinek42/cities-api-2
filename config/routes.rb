Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/cities" => "cities#index"
  post "/cities" => "cities#create"
  get "/cities/:id" => "cities#show"
  patch "/cities/:id" => "cities#update"
  delete "/cities/:id" => "cities#destroy"
end

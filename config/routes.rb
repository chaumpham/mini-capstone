Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  namespace :v1 do
    post "/users" => "users#create"

    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    
    post "/orders" => "orders#create"
  end
end
  # namespace :v2 do
  # get"/mini_capstone_one_url" => "products#product_method_one"
  # end 


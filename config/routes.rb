Rails.application.routes.draw do
  namespace :v1 do
    get "/products" => "products#index"
    get"/products/" => "products#create"
    get"/products/:id" => "products#show"
  end

  # namespace :v2 do
  # get"/mini_capstone_one_url" => "products#product_method_one"
  # end 
end

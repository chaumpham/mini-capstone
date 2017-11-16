Rails.application.routes.draw do
  namespace :v1 do
    get"/one_product_url" => "products#one_product_method"

    get "/products" => "products#index"
    get"/query_all_products_url" => "products#query_all_products_method"
  end

  # namespace :v2 do
  # get"/mini_capstone_one_url" => "products#product_method_one"
  # end 
end

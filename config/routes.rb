Rails.application.routes.draw do
  namespace :v1 do
    get"/mini_capstone_url" => "products#product_method"
  end

  # namespace :v2 do
  # get"/mini_capstone_one_url" => "products#product_method_one"
  # end 
end

class V1::ProductsController < ApplicationController
  def product_method
    products = Product.all
    render json: products.as_json
  end
end

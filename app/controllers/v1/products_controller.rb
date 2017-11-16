class V1::ProductsController < ApplicationController
  def all_products_method
    products = Product.all
    render json: products.as_json
  end

  def one_product_method
    product = Product.first
    render json: product.as_json
  end

  def query_all_product_method
    input_product = params["name"]
    render json: { message: "Your product is #{input_product}"}
  end
end

class V1::ProductsController < ApplicationController
  def all_products_method
    products = Product.all
    render json: products.as_json
  end

  def one_product_method
    product = Product.first
    render json: product.as_json
  end

  def query_all_products_method
    product_id = params["input_product_id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end
end

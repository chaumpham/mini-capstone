class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    prodcut = Product.new(
      name: params["input_name"],
      price: params["input_price"],
      image: params["input_image"],
      description: params["input_image"]
      )

    product.save
    render json: product.as_json
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end
end

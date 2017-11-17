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
      description: params["input_description"]
      )

    product.save
    render json: product.as_json
  end

  def show
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["input_name"]
    product.price = params["input_price"]
    product.image = params["input_image"]
    product.description = params["input_description"]
    product.save
    render json: product.as_json
  end
end

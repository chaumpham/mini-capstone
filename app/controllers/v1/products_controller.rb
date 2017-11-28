class V1::ProductsController < ApplicationController
  def index
    products = Product.all.order(:id => :asc)
    if params[:search]
      products = products.where("name ILIKE ?", "%#{params[:search]}%")
    elsif params[:sort_by_price]
      products = Product.all.order(:price => :asc)
    end
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params["input_name"],
      price: params["input_price"],
      image: params["input_image"],
      description: params["input_description"]
      )
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
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
    if product.save
      render json: product.as_json
    else 
      render json: {errors: product.errors.full_messages}, status: :bad_request 
    end
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Product successfully destroy!"}
  end
end

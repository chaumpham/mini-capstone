class V1::CartedProductsController < ApplicationController
  def index
    carts = current_user.carted_products
    render json: carts.as_json
  end
  def create
    product = Product.find_by(id: params[:input_product_id])
    cart = CartedProduct.new(
      status: "Carted",
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity]
      )
    if cart.save
      render json: cart.as_json
    else 
      render json: {errors: cart.errors.full_messages}, status: :bad_request
    end
  end
end
class OrdersController < ApplicationController
  def create
    product_id = params[:id]
    order = Order.findby(id: product_id)
    input_quantity = params[:input_quantity]
  end
end

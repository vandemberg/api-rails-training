class OrdersController < ApplicationController
  before_action :authorize_request

  def create
    payload = set_params

    order = BuildNewOrder.new(@current_user.id, payload).process

    render({ json: { order: order, }, status: :created })
  end

  private

  def set_params
    params.require(:order).permit(:name, :phone, :product, :price, :pieces, :interval, :date)
  end
end

class CustomersController < ApplicationController
  before_action :authorize_request

  # GET /customers
  def index
    @customers = Customer.where({
      user_id: @current_user.id
    })

    render json: @customers
  end
end

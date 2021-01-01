class PaymentsController < ApplicationController
  before_action :authorize_request
  before_action :set_payment, only: [:show, :update, :destroy]

  # GET /payments
  def index
    @payments = Payment.
      select(
        'payments.id',
        'customers.name',
        'customers.phone',
        'orders.product',
        'payments.pay_day',
        'payments.total',
        'payments.value_payed',
        'payments.number_piece',
        'orders.pieces'
      ).
      joins('inner join orders on orders.id = payments.order_id').
      joins('inner join customers on customers.id = orders.customer_id').
      where('orders.user_id = ?', @current_user.id).
      group('payments.id').
      order('payments.pay_day')


    render json: @payments
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:order_id, :pay_day, :total, :value_payed, :interest)
    end
end

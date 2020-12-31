class BuildNewOrder
  def initialize(user_id, payload)
    @data = payload
    @user_id = user_id
  end

  def process
    customer = Customer.create({
      name: @data[:name],
      phone: @data[:phone],
      user_id: @user_id,
    })

    order = Order.create({
      customer_id: customer.id,
      user_id: @user_id,
      price: @data[:price],
      interval: @data[:interval],
      product: @data[:product],
    })

    value_per_payment = @data[:price].to_f / @data[:pieces].to_f
    payment_day = @data[:date].to_date

    @data[:pieces].to_i.times.each do |index|
      Payment.create({
        order_id: order.id,
        pay_day: payment_day,
        total: value_per_payment,
        value_payed: 0,
        interest: 0,
      })

      payment_day += order.interval.days
    end

    order
  end
end

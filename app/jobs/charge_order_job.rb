class ChargeOrderJob < ApplicationJob
  queue_as :default

  # Do something later
  def perform(order, pay_type_params)
    order.charge!(pay_type_params)
  end
end

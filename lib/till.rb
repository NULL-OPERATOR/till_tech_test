require "json"
# require_relative "./order"
# require_relative "./shop"
# require_relative "./shop_data"

class Till

  def hello(input)
    "ahaa" + input
  end
  # def initialize(input, shop, order)
  #   @shop = shop || Shop.new(input)
  #   @order = order || Order.new(@shop.menu)
  # end
  #
  # def add_name(name="")
  #   @names << name
  # end
  #
  # def pay(cash)
  #   @cash = cash
  # end
  #
  # private
  #
  # def time_date
  #   Time.now.asctime
  # end
  #
  # def calculate_change
  #   @cash - total
  # end
end

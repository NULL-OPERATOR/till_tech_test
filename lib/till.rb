require "json"
require_relative "./order"
require_relative "./shop"

class Till
  attr_reader :order_history, :order, :shop
  def initialize
    @order_history = []
    @order = "setup"
  end

  def new_order(input, shop_klass, order_klass)
    @order_history << @order
    @shop = shop_klass || Shop.new(input)
    @order = order_klass || Order.new(@shop.item("prices"))
  end

  def finalise(cash)
    # @cash = cash
  end

end

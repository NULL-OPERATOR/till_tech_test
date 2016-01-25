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

  def add_item(item, quantity=1)
    # @order.add(item, quantity)
    # @order.list
    "potato"
  end

  def finalise(cash)
    # @cash = cash
  end
end

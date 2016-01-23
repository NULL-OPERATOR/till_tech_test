require "json"
require_relative "./order"
require_relative "./shop"
require_relative "./shop_data"


class Till
  def to
    [{ "id": 1, "name": "Foo" },{ "id": 2, "name": "Bar" }].to_json
  end
  #
  # def initialize(order, shop, input)
  #   @shopdata = ShopData(input)
  #   @order = order || Order.new(@shopdata)
  # end
  #
  # def add_name(name="")
  #   @names << name
  # end
  #
  # def add_order(item, quantity=1)
  #   @order[item] ? @order[item] += quantity : @order[item] = quantity
  #   add_price(item, quantity)
  # end
  #
  # def pay(cash)
  #   @cash = cash
  # end
  #
  # # def receipt
  # #   bill ={total: total,
  # #     timeDate: time_date,
  # #     shopName: @input["shopName"],
  # #     address: @input["address"],
  # #     phone: @input["phone"],
  # #     names: @names.join(", "),
  # #     orderList: order_list.to_h,
  # #     discounts: @food_discounts + bill_discount,
  # #     tax: tax,
  # #     cash: @cash,
  # #     change: calculate_change,
  # #     subTotal: @sub_total
  # #   }
  #   # File.open("bill.json","w"){|f| f << JSON.pretty_generate(bill) }
  #   # JSON.pretty_generate(bill)
  # end
  #
  # private
  #
  # def add_price(item, quantity)
  #   @sub_total += (@menu[item] * quantity)
  #   food_discount(item)
  # end
  #
  # def time_date
  #   Time.now.asctime
  # end
  #
  # def order_list
  #   @order.map do |item,amount|
  #   [item, (amount.to_s + " x " + "#{@menu[item]}")]
  #   end
  # end
  #
  # def calculate_change
  #   (@cash - total) rescue 0
  # end
end

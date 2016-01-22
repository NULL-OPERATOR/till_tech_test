require "json"

class Till
  def to
    [{ "id": 1, "name": "Foo" },{ "id": 2, "name": "Bar" }].to_json
  end
  # attr_reader :menu, :order
  # TAX = 0.0864
  #
  # def initialize(input)
  #   @order,
  #   @sub_total,
  #   @food_discounts,
  #   @names = {}, 0, 0, []
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
  # def receipt
  #   bill ={total: total,
  #     timeDate: time_date,
  #     shopName: @input["shopName"],
  #     address: @input["address"],
  #     phone: @input["phone"],
  #     names: @names.join(", "),
  #     orderList: order_list.to_h,
  #     discounts: @food_discounts + bill_discount,
  #     tax: tax,
  #     cash: @cash,
  #     change: calculate_change,
  #     subTotal: @sub_total
  #   }
  #   File.open("bill.json","w"){|f| f << JSON.pretty_generate(bill) }
  #   JSON.pretty_generate(bill)
  # end
  #
  # private
  #
  # def add_price(item, quantity)
  #   @sub_total += (@menu[item] * quantity)
  #   food_discount(item)
  # end
  #
  # def food_discount(food)
  #   @food_discounts += food.include?("Muffin") ? @menu[food] * 0.1 : 0
  # end
  #
  # def bill_discount
  #   @sub_total >= 50 ? @sub_total * 0.05 : 0
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
  # def tax
  #   (@sub_total * TAX)
  # end
  #
  # def total
  #   @sub_total + tax - @food_discounts - bill_discount
  # end
  #
  # def calculate_change
  #   (@cash - total) rescue 0
  # end
end

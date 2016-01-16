require "json"

class Till
  attr_reader :menu, :order, :names, :discounts, :sub_total
  TAX = 0.0864

  def initialize(input)
    json_input = input || File.read("hipstercoffee.json")
    @input =  (JSON.parse(json_input)).reduce
    @menu = @input["prices"][0]
    @order, @sub_total, @discounts, @names = {}, 0, 0, []
  end

  def show_menu
    @menu
  end

  def add_order(item, quantity=1)
    @order[item] ? @order[item] += quantity : @order[item] = quantity
    add_price(item, quantity)
  end

  def add_name(name="")
    @names << name
  end

  def receipt
    bill ={total: total,
           timeDate: time_date,
           shopName: @input["shopName"],
           address: @input["address"],
           phone: @input["phone"],
           names: @names,
           orderList: order_list.to_h,
           discounts: @discounts,
           tax: tax,
           subTotal: @sub_total}
    File.open("bill.json","w"){|f| f << JSON.pretty_generate(bill) }
    JSON.pretty_generate(bill)
  end

  private

  def add_price(item, quantity)
    @sub_total += (@menu[item] * quantity)
    food_discount(item)
  end

  def food_discount(food)
    @discounts += food.include?("Muffin") ? @menu[food] * 0.1 : 0
  end

  def bill_discount
    @sub_total >= 50 ? @discounts += @sub_total * 0.05 : 0
  end

  def time_date
    Time.now.asctime
  end

  def order_list
    @order.map do |item,amount|
    [item, (amount.to_s + " x " + "#{@menu[item]}")]
    end
  end

  def tax
    @sub_total * TAX
  end

  def total
    bill_discount
    @sub_total + tax - @discounts
  end
end

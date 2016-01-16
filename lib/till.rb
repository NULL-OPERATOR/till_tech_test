require "oj"
require "json"

class Till
  attr_reader :menu, :order, :names
  TAX = 8.64
  def initialize(input)
    json_input = input || File.read("hipstercoffee.json")
    @input =  (JSON.parse(json_input)).reduce
    @menu = @input["prices"][0]
    @order = {}
    @sub_total = []
    @names = []
  end

  def show_menu
    @menu
  end

  def add_order(item, quantity=1)
    @order[item] ? @order[item] += quantity : @order[item] = quantity
    add_price(item, quantity)
  end

  def add_price(item, quantity)
    @sub_total << @menu[item] * quantity
  end

  def add_name(name="")
    @names.push(name)
  end

  def add_name(name)
    @names << name
  end

  def receipt
    bill ={timeDate: time_date,
           shopName: @input["shopName"],
           address: @input["address"],
           phone: @input["phone"],
           names: @names,
           orderList: order_list.to_h,
           total: total}
    File.open("bill.json","w"){|f| f << JSON.pretty_generate(bill) }
    JSON.pretty_generate(bill)
  end

  private

  def time_date
    Time.now.asctime
  end

  def order_list
    @order.map do |item,amount|
    [item, (amount.to_s+" x " + "#{@menu[item]}")]
    end
  end

  def total
    @sub_total.reduce(:+)
  end
end

require "oj"
require "json"

class Till
  attr_reader :menu
  TAX = 8.64
  def initialize(menu)
    menu_input = menu || File.read("hipstercoffee.json")
    @menu =  (JSON.parse(menu_input)).reduce
    @order = {}
    @names = []
  end

  def show_menu
    @menu
  end

  def add_order(input, quantity=1)
    @order[input] ? @order[input] += quantity : @order[input] = quantity
  end

  def add_name(name="")
    @names.push(name)
  end

  def receipt
    nl = "\n"
    output = Time.now.asctime + nl
    output << @menu["shopName"] + nl + @menu["address"] + nl
    @order.each {|item,amount| output << item +" "+ amount+" x " + "#{@menu[item]}" + nl }
    # output << total
    output
  end

  def total
  end

  def add_name(name)
    @names << name
  end

end

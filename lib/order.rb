require_relative "./discounts"

class Order
  attr_reader :names, :items
  TAX = 0.0864
  def initialize(menu)
    @menu = menu
    @names = []
    @items = {}
    @sub_total = 0
    @food_discounts = 0
    @bill_discounts = 0
  end

  def add_name(name="")
    @names << name
  end

  def total
    @sub_total + tax - @bill_discounts
  end

  def add(item, quantity=1)
    if @items[item]
      @items[item] += quantity
    else
      @items[item] = quantity
    end
    add_price(item, quantity)
  end

  private

  def add_price(item, quantity)
    price = @menu[item]
    @sub_total += (price * quantity)
    food_discount(item)
  end

  def tax
    (@sub_total * TAX)
  end

  def food_discount(input)
    @food_discounts += input.include?("Muffin") ? @menu[input] * 0.1 : 0
  end

  def bill_discount
    if @sub_total >= 50
      @bill_discounts += @sub_total * 0.05
    end
  end

end

require_relative "./discounts"

class Order
  TAX = 0.0864
  def initialize(menu, discounts)
    @discounts = discounts || Discounts.new
    # @shop = shop || Shop.new(input)
  end


  def total
    @sub_total + tax - @food_discounts - bill_discount
  end

  def add(item, quantity=1)
    @order[item] ? @order[item] += quantity : @order[item] = quantity
    add_price(item, quantity)
  end

  def add_price(item, quantity)
    @sub_total += (@menu[item] * quantity)
    food_discount(item)
  end

  private

  def tax
    (@sub_total * TAX)
  end
  def order_list
    @order.map do |item,amount|
    [item, (amount.to_s + " x " + "#{@menu[item]}")]
    end
  end

end

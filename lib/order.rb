require_relative "./discounts"
  TAX = 0.0864
class Order
  def initialize(input, discounts, restaurant)
    @discounts = discounts || Discounts.new
    @restaurant = restaurant || Restaurant.new(input)
  end

  private

  def tax
    (@sub_total * TAX)
  end

  def total
    @sub_total + tax - @food_discounts - bill_discount
  end

end

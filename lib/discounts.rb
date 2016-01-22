class Discounts
  def initialize
    @food_total = 0
    @bill_total = 0
  end

  def food(food, )
    @food_discounts += food.include?("Muffin") ? @menu[food] * 0.1 : 0
  end

  def bill
    @sub_total >= 50 ? @sub_total * 0.05 : 0
  end
end

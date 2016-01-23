class Discounts
  def initialize
    @food_total = 0
    @bill_total = 0
  end

  def food(food, price)
    if food.include?("Muffin")
      @food_total += price * 0.1
    end
  end

  def bill(sub_total)
    if sub_total >= 50
      @bill_total += sub_total * 0.05
    end
  end
end

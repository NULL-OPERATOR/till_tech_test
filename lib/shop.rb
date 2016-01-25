require "json"

class Shop
  def initialize(input)
    @input = (JSON.parse(input ||  File.read("hipstercoffee.json" ))).reduce
  end

  def item(get_item)
    get_item == "prices" ? @input["prices"][0] : @input[get_item]
  end
end

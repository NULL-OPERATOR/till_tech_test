class Restaurant
  def initialize(input)
    json_input = input || File.read("hipstercoffee.json")
    @input = (JSON.parse(json_input)).reduce
  end

  def menu_items
    @input["prices"][0]
  end

  def phone_number
    @input["phone"]
  end

  def address
    @input["address"]
  end

  def shop_name
    @input["shopName"]
  end

end

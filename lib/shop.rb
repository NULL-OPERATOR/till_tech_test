require "json"

class Shop
  def initialize(input)
    @data = (JSON.parse(input ||  File.read("hipstercoffee.json" ))).reduce
  end

  def menu
    @input["prices"][0]
  end

  def phone
    @input["phone"]
  end

  def address
    @input["address"]
  end

  def name
    @input["shopName"]
  end

end

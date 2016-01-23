require "json"

class Shop
  def initialize(input)
    @data = (JSON.parse(input ||  File.read("hipstercoffee.json" ))).reduce
  end
end

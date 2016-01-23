class ShopData
  def self.menu_items(input)
    input["prices"][0]
  end

  def self.phone_number(input)
    input["phone"]
  end

  def self.address(input)
    input["address"]
  end

  def self.name(input)
    input["shopName"]
  end

end

require 'order'

describe Order do
  let(:order) { Order.new(menu) }
  let(:menu) { {"Coffee"=>4.75, "Muffin"=> 1} }

  before(:each) do

  end

  it "adds a name to the order" do
    order.add_name("om nom")
    expect(order.names).to include("om nom")
  end

  before(:each) do
    order.add("Coffee", 2)
  end

  it "adds an order" do
    expect(order.items["Coffee"]).to eq(2)
  end

  it "can add more items to the order" do
    order.add("Coffee")
    expect(order.items["Coffee"]).to eq(3)
  end

  it "calculates a total" do
    expect(order.total).to eq(10.3208)
  end
end

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

  # it "adds the price to the sub total" do


  # context "Outputting the receipt: " do
  #   it "lists the item ordered and price" do
  #     expect(till.receipt).to include("\"Coffee\": \"2 x 4.75")
  #   end
  #
    # it "lists the restaurant name and phone number" do
    #   expect(till.receipt).to include("oh" && "007")
    # end
  #
  #   it "outputs a sub-total" do
  #     expect(till.receipt).to include("\"subTotal\": 9.5")
  #   end
  #
  #   it "outputs a total plus tax" do
  #     expect(till.receipt).to include(" \"total\": 10.3208")
  #   end
  #
  #   it "shows the current time and date" do
  #     expect(till.receipt).to include(time_and_date)
  #   end
  # end
  #
  # context "Calculating discounts: " do
  #   it "calculates muffin discount at 10%" do
  #     till.add_order("Muffin")
  #     expect(till.receipt).to include("\"discounts\": 0.1")
  #   end
  #
  #   it "calculates over $50 discount at 5%" do
  #     till.add_order("Coffee", 10)
  #     expect(till.receipt).to include("\"discounts\": 2.85")
  #   end
  # end
  #
  # context "Payments: " do
  #   before(:each) { till.pay(30) }
  #
  #   it "can handle a payment input" do
  #     expect(till.receipt).to include("\"cash\": 30")
  #   end
  #
  #   it "calculates the change needed" do
  #     expect(till.receipt).to include("\"change\": 19.6792")
  #   end
  end

require "spec_helper"
require "till"
require "json"

describe Till do
  let(:till) {Till.new(menu_items)}
  let(:menu_items) { [{shopName:"oh",
                       address:"12",
                       phone:"007",
                       prices:[{Coffee: 4.75, Muffin: 1}]}].to_json }
  # let(:parsed_items) { (JSON.parse(menu_items)).reduce }
  let(:menu_output) { {"Coffee"=>4.75, "Muffin"=>1} }
  let(:time_and_date) { Time.now.asctime }

  it "shows a list of menu items" do
    expect(till.show_menu).to eq(menu_output)
  end

  before(:each) do
    till.add_order("Coffee", 2)
  end

  context "Ordering: " do
    it "adds an order" do
      expect(till.order["Coffee"]).to eq(2)
    end

    it "can add more items to the order" do
      till.add_order("Coffee")
      expect(till.order["Coffee"]).to eq(3)
    end

    it "can assign a name to the order" do
      till.add_name("gnarr")
      expect(till.names).to include("gnarr")
    end
  end

  context "Outputting the receipt: " do
    it "lists the item ordered and price" do
      expect(till.receipt).to include("Coffee" && "2 x 4.75")
    end

    it "lists the restaurant name and phone number" do
      expect(till.receipt).to include("oh" && "007")
    end

    it "outputs a sub-total" do
      expect(till.receipt).to include("subTotal" && "9.5")
    end

    it "outputs a total plus tax" do
      expect(till.receipt).to include("total" && "10.3208")
    end

    it "shows the current time and date" do
      expect(till.receipt).to include(time_and_date)
    end
  end

  context "Calculating discounts: " do
    it "calculates muffin discount at 10%" do
      till.add_order("Muffin")
      expect(till.discounts).to eq(0.1)
    end

    it "calculates over $50 discount at 5%" do
      till.add_order("Coffee", 10)
      till.receipt
      expect(till.discounts).to eq(2.85)
    end
  end

end

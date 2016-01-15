require "till"
require "json"

describe Till do
  let(:till) {Till.new(menu_items)}
  let(:menu_items) { [{shopName:"oh",
                     address:"12",
                     phone:"007",
                     prices:[{Coffee: 4.75}]}].to_json }
  let(:parsed_items) { (JSON.parse(menu_items)).reduce }

  it "shows a list of items" do
    expect(till.show_menu).to eq(parsed_items)
  end

  context "Ordering:" do
    before(:each) do
       till.add_order("Coffee", 2)
     end

    it "creates an order" do
      # till.order("Coffee", 2)
      expect(till.receipt).to include("$9.50")
    end

    it "creates an order with a total" do
      # till.order("Coffee", 2)
      expect(till.receipt).to include("Coffee 2 x 4.75")
    end

    it "can assign a name to the order" do
      till.add_name("gnarr")
      expect(till.receipt).to include("gnarr")
    end
  end
end

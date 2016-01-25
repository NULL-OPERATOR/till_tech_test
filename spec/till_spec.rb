require "spec_helper"
require "till"
# require "json"

describe Till do
  let(:till)          { Till.new }
  let(:data)          { double(:data) }
  let(:shop)          { double(:shop) }
  let(:order)         { double(:order) }
  let(:menu_output)   { {"Coffee"=>4.75, "Muffin"=>1} }
  let(:time_and_date) { Time.now.asctime }

  before(:each) do
    # allow(order).to receive(:add)
    allow(shop).to receive(:item).and_return("item")
  end


  context "Initiate a new order: " do
    it "adds the current order to the history" do
      expect{till.new_order(data,shop,order)}.to change{till.order_history}
    end

    it "sets up a new order" do
      till.new_order(data,shop,order)
      expect(till.order).to eq(order)
    end
  end
end

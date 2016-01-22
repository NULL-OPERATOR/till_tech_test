require "spec_helper"
require "till"
require "json"

describe Discounts do
  let(:discounts) {Discounts.new}

  context "Calculating discounts: " do
    it "calculates muffin discount at 10%" do
      till.add_order("Muffin")
      expect(till.receipt).to include("\"discounts\": 0.1")
    end

    it "calculates over $50 discount at 5%" do
      till.add_order("Coffee", 10)
      expect(till.receipt).to include("\"discounts\": 2.85")
    end
  end
end

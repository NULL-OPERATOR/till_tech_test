require "spec_helper"
# require "json"
require "discounts"

describe CheckDiscounts do
  let(:discounts) { CheckDiscounts.new }

  it "calculates muffin discount at 10%" do
    expect(discounts.food("Muffin", 5)).to eq(0.5)
  end

  it "calculates over $50 discount at 5%" do
    expect(discounts.bill(60)).to eq 3
  end
end

require "restuarant"

describe Restaurant do
  let(:restuarant) { Restaurant.new(details)}
  let(:menu_items) { [{shopName:"oh",
                       address:"12",
                       phone:"007",
                       prices:[{Coffee: 4.75, Muffin: 1}]}].to_json }
  # let(:parsed_items) { (JSON.parse(menu_items)).reduce }
  let(:menu_output) { {"Coffee"=>4.75, "Muffin"=>1} }
  let(:time_and_date) { Time.now.asctime }

  it "parses a menu selection" do

  end

end

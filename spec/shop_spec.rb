require 'shop'

describe Shop do

  let(:menu_items) { [{shopName:"oh",
                       prices:[{Coffee: 4.75, Muffin: 1}]}].to_json }
  let(:shop) { Shop.new(menu_items) }
  let(:output_menu) { {"Coffee"=>4.75, "Muffin"=> 1} }


  it "gets the prices" do
    expect(shop.item("prices")).to eq(output_menu)
  end

  it "gets the shop name" do
    expect(shop.item("shopName")).to eq("oh")
  end

end

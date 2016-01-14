require 'till'

describe Till do
  let(:till) {Till.new}
  let(:menu_items) { {Coffee: 4.75, Pie: 1.27}

  it 'shows a list of items' do
    expect(till.show_menu).to eq(:menu_items)
  end
end

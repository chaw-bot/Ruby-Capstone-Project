require_relative '../lib/classes/label.rb'
require_relative '../lib/classes/item.rb'

describe Label do
  title = 'Gaumont'
  color = 'Black'
  let(:label) { Label.new(title, color) }
  let(:item) { Item.new('2021/11/11') }

  it 'The title should be Gaumont' do
    expect(label.title).to eq('Gaumont')
  end

  it 'Color should be Black' do
    expect(label.color).to eq('Black')
  end

  it 'label should be an instance of Label' do
    expect(label).to be_an_instance_of(Label)
  end

  it 'add_item method test' do
    label.add_item(item)
    expect(label.items[0]).to eq(item)
  end
end
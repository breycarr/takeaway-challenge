require 'order'

describe Order do

  let(:subject) { Order.new }
  dish = "burrito"
  not_dish = "not dish"

  describe "#add" do
    it "adds an item to the order" do
      # These stubs are not currently doing anything
      allow(dish).to receive(:available?).and_return(true)
      expect(subject.add(dish)).to include(dish)
    end

    it "can add multiple items to the order" do
      allow(dish).to receive(:available?).and_return(true)
      subject.add(dish, 3)
      expect(subject::choice).to eq([dish, dish, dish])
    end

    it "will not add a dish that is not on the menu" do
      allow(not_dish).to receive(:available?).and_return(false)
      expect { subject.add(not_dish) }.to raise_error "#{not_dish} is not available"
    end
  end
end

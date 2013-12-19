require 'card'

describe 'initialization' do
	context 'value convertion' do
		it 'should convent king symbol to value 13' do
			card = Card.new(:king, :clubs)
			card.value.should eq(13)
		end

		it 'should store digit values' do
			card = Card.new(4, :clubs)
			card.value.should eq(4)
		end
	end

	describe 'validity' do
		it 'should be valid with good params' do
			card = Card.new(10, :clubs)
			card.valid?.should be_true
		end

		it 'should be invalid with bad value param' do
			card = Card.new(15, :clubs)
			card.valid?.should be_false
		end

		it 'should be invalid with bad suit' do
			card = Card.new(10, :clubbbs)
			card.valid?.should be_false
		end

		it 'should be valid with king symbol face-card value' do
			card = Card.new(:king, :clubs)
			card.valid?.should be_true
		end

		it 'should be valid with queen face-card value' do
			card = Card.new(:queen, :clubs)
			card.valid?.should be_true
		end

		it 'should be valid with jack symbol value' do
			card = Card.new(:jack, :diamonds)
			card.valid?.should be_true
		end

		it 'should be valid with symbol face-card value' do
			card = Card.new(:ace, :diamonds)
			card.valid?.should be_true
		end

		it 'should be valid with symbol face-card value' do
			card = Card.new(:ace, :diamonds)
			card.valid?.should be_true
		end
	end
end
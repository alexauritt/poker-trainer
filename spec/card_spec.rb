require 'card'

describe 'intialization' do
	it 'should be valid with good params' do
		card = Card.new(10, :clubs)
		card.valid?.should be_true
	end

	it 'should be valid with bad value param' do
		card = Card.new(20, :clubs)
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
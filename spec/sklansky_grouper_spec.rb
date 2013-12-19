require 'sklansky_grouper.rb'
require 'card.rb'

describe "group_number" do
	it 'should return nil for worthless group' do
		c1 = Card.new(2, :clubs)
		c2 = Card.new(4, :spades)
		SklanskyGrouper.group_number(c1, c2).should be_nil
	end

	context "pairs" do

		it 'should group ace pairs correctly' do
			c1 = Card.new(:ace, :clubs)
			c2 = Card.new(:ace, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(1)
		end

		it 'should group king pairs correctly' do
			c1 = Card.new(:king, :clubs)
			c2 = Card.new(:king, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(1)
		end

		it 'should group queen pairs correctly' do
			c1 = Card.new(:queen, :clubs)
			c2 = Card.new(:queen, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(1)
		end

		it 'should group jack pairs correctly' do
			c1 = Card.new(:jack, :clubs)
			c2 = Card.new(:jack, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(1)
		end

		it 'should group 10 pairs correctly' do
			c1 = Card.new(10, :clubs)
			c2 = Card.new(10, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(2)
		end

		it 'should group 9 pairs correctly' do
			c1 = Card.new(9, :clubs)
			c2 = Card.new(9, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(3)
		end

		it 'should group 8 pairs correctly' do
			c1 = Card.new(8, :clubs)
			c2 = Card.new(8, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(4)
		end

		it 'should group 7 pairs correctly' do
			c1 = Card.new(7, :clubs)
			c2 = Card.new(7, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(5)
		end

		it 'should group 6 pairs correctly' do
			c1 = Card.new(6, :clubs)
			c2 = Card.new(6, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(5)
		end	

		it 'should group 5 pairs correctly' do
			c1 = Card.new(5, :clubs)
			c2 = Card.new(5, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(6)
		end

		it 'should group 4 pairs correctly' do
			c1 = Card.new(4, :clubs)
			c2 = Card.new(4, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(7)
		end

		it 'should group 3 pairs correctly' do
			c1 = Card.new(3, :clubs)
			c2 = Card.new(3, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(7)
		end			

		it 'should group 2 pairs correctly' do
			c1 = Card.new(2, :clubs)
			c2 = Card.new(2, :spades)		
			SklanskyGrouper.group_number(c1, c2).should eq(7)
		end
	end

	describe 'is_suited?' do
		it 'should identify suited pair' do
			c1 = Card.new(2, :clubs)
			c2 = Card.new(3, :clubs)		
			SklanskyGrouper.is_suited?(c1, c2).should be_true
		end

		it 'should identify non suited pair' do
			c1 = Card.new(2, :clubs)
			c2 = Card.new(3, :diamonds)		
			SklanskyGrouper.is_suited?(c1, c2).should be_false
		end


	end

end
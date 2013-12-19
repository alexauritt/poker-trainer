class SklanskyGrouper
	def self.group_number(card1, card2)
		val = nil
		if is_pair?(card1, card2)
			pair_rating(card1.value)
		else 
			nil
		end
	end

	def self.is_pair?(c1, c2)
		c1.value == c2.value
	end

	def self.is_suited?(c1, c2)
		c1.suit == c2.suit
	end

	def self.connectors?(c1, c2)
		distance(c1,c2) == 1
	end

	def self.pair_rating(card_value)
		case card_value
			when 14,13,12,11
				1
			when 10
				2
			when 9
				3
			when 8
				4
			when 7, 6
				5
			when 5
				6
			when 4, 3, 2
				7
			else
				nil
			end
	end

	def self.distance(c1, c2)
		standard_distance = (c2.value - c1.value).abs
		alt_difference = standard_distance

		if (c1.value == 14) || (c2.value == 14)
			c1adj = c1.value == 14 ? 1 : c1.value
			c2adj = c2.value == 14 ? 1 : c2.value
			alt_difference = (c1adj - c2adj).abs
		end

		alt_difference < standard_distance ? alt_difference : standard_distance
	end

	private_class_method :is_pair?, :pair_rating
end
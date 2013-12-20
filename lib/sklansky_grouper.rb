class SklanskyGrouper
	def self.group_number(card1, card2)
		val = nil
		if is_pair?(card1, card2)
			pair_rating(card1.value)
		elsif is_suited_connector?(card1, card2)
			suited_connector_rating(card1, card2)
		elsif is_suited?(card1, card2)
			suited_rating(card1, card2)
		else
			nil
		end
	end

	# pair helpers -- should be abstracted to module
	def self.is_suited_connector?(c1, c2)
		is_suited?(c1, c2) and connectors?(c1, c2)
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

	# rating mappers -- private
	def self.suited_rating(card1, card2)
		return suited_connector_rating(card1, card2) if connectors?(card1, card2)
		
		higher_value = card1.value > card2.value ? card1.value : card2.value
		lower_value = card1.value < card2.value ? card1.value : card2.value

		# suited aces (non connectors)
		if higher_value == 14
			case lower_value
			when 12, 11
				return 2
			when 10
				return 3
			else
				return 5
			end
		elsif higher_value == 13
			case lower_value
			when 11
				return 3
			when 10
				return 4
			else
				return 7
			end
		end
		20
	end

	def self.suited_connector_rating(card1, card2)
		higher_value = card1.value > card2.value ? card1.value : card2.value

		# we need to check for ace / 2
		if higher_value == 14
			lower_value = card1.value < card2.value ? card1.value : card2.value
			higher_value = 2 if lower_value == 2
		end

		case higher_value
			when 14
				1
			when 13
				2
			when 12, 11
				3
			when 10, 9
				4
			when 8, 7, 2
				5
			when 6, 5
				6
			when 4
				7
			when 3
				8
			else
				nil
			end
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

	private_class_method :is_pair?, :pair_rating
end
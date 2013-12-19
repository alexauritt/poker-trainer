class SklanskyGrouper
	def self.group_number(card1, card2)
		val = nil
		if is_pair?(card1, card2)
			case card1.value
				when :ace, :king, :queen, :jack
					1
				when 14..11
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
		else 
			nil
		end
	end

	def self.is_pair?(c1, c2)
		c1.value == c2.value
	end

	private_class_method :is_pair?
end
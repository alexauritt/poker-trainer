class Card
	attr_accessor :suit, :value

	SUITS = [:hearts, :clubs, :diamonds, :spades]
	VALUE_NAMES = [:ace, :king, :queen, :jack]
	
	def initialize(value, suit)
		@suit = suit
		@value = value
	end

	def valid?
		# return false unless value
		is_suit_valid = false
		is_valud_valid = false

		if suit.is_a? Symbol
			is_suit_valid = SUITS.include? suit
		else
			is_suit_valid = false
		end

		if value.is_a? Symbol
			is_value_valid = VALUE_NAMES.include? value
		else
			is_value_valid = (value < 15) 
		end

		is_suit_valid and is_value_valid
	end
end
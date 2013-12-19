class Card
	attr_accessor :suit
	attr_reader :value

	SUITS = [:hearts, :clubs, :diamonds, :spades]
	VALUE_NAMES = [:ace, :king, :queen, :jack]
	
	def initialize(value, suit)
		@suit = suit
		self.value = value
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

		is_suit_valid and value < 15
	end

	def value=(value)
		if value.is_a? Symbol
			case value
			when :ace
				@value = 14
			when :king
				@value = 13
			when :queen
				@value = 12
			when :jack
				@value = 11
			end
		else
			@value = value
		end
	end
end
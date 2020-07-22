class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(cat)
    @cards.select do |card|
      card.category == cat
    end
  end

end

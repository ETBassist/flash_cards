class Round
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[0])
    puts @turns.last.feedback
    self.next_card
  end


  def next_card
    card = @deck.cards.shift
    @deck.cards << card
  end

  def current_card
    @deck.cards[0]
  end

  def number_correct
    @turns.count {|turn| turn.feedback == "Correct!" }
  end

  def number_correct_by_category(cat)
    @turns.count {|turn| turn.feedback == "Correct!" && turn.card.category == cat}
  end

  def percent_correct
    100 * (self.number_correct / @turns.length.to_f)
  end

  def percent_correct_by_category(cat)
    100 * (self.number_correct_by_category(cat) / @turns.count { |turn| turn.card.category == cat }.to_f)
  end

end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'


class TurnTest < Minitest::Test
  def test_card_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    assert_equal card, turn.card
  end

  def test_can_read_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    assert_equal "Guess", turn.guess
  end

  def test_can_read_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    refute turn.correct?
  end

  def test_can_return_true_if_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?
  end

  def test_can_give_feedback_when_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_can_give_feedback_when_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    assert_equal "Incorrect.", turn.feedback
  end

end

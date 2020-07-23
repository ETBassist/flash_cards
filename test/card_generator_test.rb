require './test/test_helper'

class CardGeneratorTest < Minitest::Test
  def test_class_exists
    new_cards = CardGenerator.new("./lib/cards.txt")

    assert_instance_of CardGenerator, new_cards
  end

  def test_cards_exist
    new_cards = CardGenerator.new("./lib/cards.txt")

    assert_equal 2, new_cards.cards.length
  end

  def test_can_access_answers
    new_cards = CardGenerator.new("./lib/cards.txt")

    assert_equal "answer1", new_cards.cards[0].answer
  end
end

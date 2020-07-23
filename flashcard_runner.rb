require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

# card_1 = Card.new("What is 5 - 2?", "3", :Math)
# card_2 = Card.new("What is 4 - 2?", "2", :Math)
# card_3 = Card.new("What is 10 * 2?", "20", :Math)
# card_4 = Card.new("Who is my favorite author?", "Italo Calvino", :Legit)
# card_5 = Card.new("True or false: this statement is false.", "What", :Legit)
generated_cards = CardGenerator.new('./lib/cards.txt')
deck = Deck.new(generated_cards.cards)
round = Round.new(deck)

print "Welcome! Press Enter to begin or Ctrl + C to quit"
gets

puts "Let's Begin! You're playing with #{round.deck.cards.length} cards."
puts "=================================="
turn_counter = 0
while turn_counter < round.deck.cards.length
  puts "This is card number #{turn_counter + 1} out of #{round.deck.cards.length}."
  puts "Question: #{round.current_card.question}"
  answer = gets.chomp
  round.take_turn(answer)
  turn_counter += 1
end
puts "***** Game over! *****"
puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct}%."
categories = round.deck.cards.group_by do |card|
  card.category
end
categories.each do |category, cards|
  puts "#{category}: #{round.percent_correct_by_category(category)}% correct."
end

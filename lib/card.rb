class Card
  attr_reader :question, :answer, :category

  def initialize(*q)
    q = q.flatten
    @question = q[0]
    @answer = q[1]
    @category = q[2]
  end
end

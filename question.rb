class Question
  attr_reader :question, :random_number1, :random_number2

  def initialize
    @random_number1 = rand(1..10)
    @random_number2 = rand(1..10)
    @question = "What does #{@random_number1} plus #{@random_number2} equal?"
  end

  def total
    "#{@random_number1 + @random_number2}"
  end
end

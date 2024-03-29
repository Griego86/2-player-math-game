class MathQuestion
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def generate_question
    "What is #{@num1} + #{@num2}?"
  end

  def check_answer(answer)
    answer.to_i == @num1 + @num2
  end
end

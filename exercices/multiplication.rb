module Exercices
  module Multiplication
    def self.generate
      x = rand(1000)
      y = rand(1000)

      { question: "#{x} x #{y} =", solution: x * y }
    end
  end
end
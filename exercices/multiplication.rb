module Exercices
  module Multiplication
    def self.generate
      x = rand(100)
      y = rand(100)

      { question: "#{x} x #{y} =", solution: x * y }
    end
  end
end
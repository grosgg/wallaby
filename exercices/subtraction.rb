module Exercices
  module Subtraction
    def self.generate
      x = rand(10000)
      y = rand(0..x)

      { question: "#{x} - #{y} =", solution: x - y }
    end
  end
end
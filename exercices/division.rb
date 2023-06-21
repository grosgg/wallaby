module Exercices
  module Division
    def self.generate
      x = rand(5..50)
      y = rand(2..5)
      z = x * y

      { question: "#{z} : #{y} =", solution: x }
    end
  end
end
module Exercises
  module Tables
    module Multiplication
      def self.generate
        x = rand(1..10)
        y = rand(1..10)

        { question: "#{x} x #{y} =", solution: x * y }
      end
    end
  end
end
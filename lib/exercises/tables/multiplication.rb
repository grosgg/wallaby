module Exercises
  module Tables
    module Multiplication
      def self.generate
        x = rand(2..9)
        y = rand(2..9)

        { question: "#{x} x #{y} =", solution: x * y }
      end
    end
  end
end
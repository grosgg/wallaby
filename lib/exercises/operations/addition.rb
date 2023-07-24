module Exercises
  module Operations
    module Addition
      def self.generate
        x = rand(10000)
        y = rand(10000)

        { question: "#{x} + #{y} =", solution: x + y }
      end
    end
  end
end
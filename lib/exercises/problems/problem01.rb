module Exercises
  module Problems
    module Problem01
      def self.generate
        item = Factories::ItemName.get.first
        people = Factories::FirstName.get(3)
        x = rand(90) + 10
        y = rand(3) + 2
        z = rand(20)

        {
          question: "#{people[0]} a #{x} #{item}. #{people[1]} a #{y} fois plus de #{item} que #{people[0]}. #{people[2]} a #{z} #{item} de moins que #{people[1]}. Combien de #{item} a #{people[2]}?",
          solution: x * y - z
        }
      end
    end
  end
end
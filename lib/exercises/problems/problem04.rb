module Exercises
  module Problems
    module Problem04
      def self.generate
        name = Factories::FirstName.get.first
        date = Time.at(rand(3849951600) - 2209021200) # from 1900 until 2022

        {
          question: "La date de naissance de #{name} est le #{date.strftime("%d/%m/%Y")}. Quel est son âge?",
          solution: ((Time.now.to_i - date.to_i) / 3600.0 / 24 / 365).floor
        }
      end
    end
  end
end
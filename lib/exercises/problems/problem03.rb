module Exercises
  module Problems
    module Problem03
      def self.generate
        hh = %w{00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23}.sample
        mm = %w{00 05 10 15 20 25 30 35 40 45 50 55}.sample

        {
          question: "Dessine le cadran d'une horloge réglée sur #{hh}:#{mm}",
          solution: "~"
        }
      end
    end
  end
end
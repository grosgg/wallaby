module Exercises
  module Problems
    module Problem06
      def self.generate
        name = Factories::FirstName.get.first
        minutes_in_day = 60 * 24

        end_time = rand(minutes_in_day)
        start_time = rand(end_time)

        f_end_time = (end_time / 60).to_s.rjust(2, "0") + "h" + (end_time % 60).to_s.rjust(2, "0")
        f_start_time = (start_time / 60).to_s.rjust(2, "0") + "h" + (start_time % 60).to_s.rjust(2, "0")

        {
          question: "Calcule le temps écoulé entre #{f_start_time} et #{f_end_time}.",
          solution: ((end_time - start_time) / 60).to_s.rjust(2, "0") + "h" + ((end_time - start_time) % 60).to_s.rjust(2, "0")
        }
      end
    end
  end
end
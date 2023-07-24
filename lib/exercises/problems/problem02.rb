module Exercises
  module Problems
    module Problem02
      def self.generate
        place = Factories::PlaceName.get.first
        people = Factories::FirstName.get(4)
        distances = Array.new(4).map.with_index { |n,i| { people: people[i], **get_distance } }
        sorted = distances.sort{ |a,b| a[:value] <=> b[:value] }.map{ |d| d[:people] }
        ascending = [true, false].sample

        {
          question: "#{distances[0][:people]} habite à #{distances[0][:label]} de #{place}, #{distances[1][:people]} à #{distances[1][:label]}, #{distances[2][:people]} à #{distances[2][:label]} et #{distances[3][:people]} à #{distances[3][:label]}. Classe les enfants du plus #{ascending ? 'proche' : 'éloigné'} au plus #{ascending ? 'éloigné' : 'proche'}.",
          solution: "~"
        }
      end

      private

      def self.get_distance
        u = %w{m km}.sample
        m = u == "km" ? (rand(5) + 1) * 1000 : rand(5000) + 50
        m = u == "km" ? m / 1000 * 1000 : m / 10 * 10
        { value: m, label: "#{m / (u == "km" ? 1000 : 1)} #{u}"}
      end
    end
  end
end
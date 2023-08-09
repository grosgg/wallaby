module Exercises
  module Problems
    module Problem05
      def self.generate
        factory = Kernel.const_get("Factories::ShopItems::#{%w{Diy Bakery Cafe}.sample}")
        items = factory.get(3)
        name = Factories::FirstName.get.first
        prices = Array.new(3).map.with_index do |n, i|
          up = (factory::PRICE_RANGE[0] + rand(factory::PRICE_RANGE[1] - factory::PRICE_RANGE[0])) / 10 * 10
          q = rand(8) + 2
          {
            item: items[i],
            unit_price: up,
            quantity: q,
            label: "#{q} #{items[i]} à #{up}¥ l'unité"
          }
        end
        

        {
          question: "#{factory::SHOP} de #{name} a vendu #{prices.map{|p| p[:label] }.join(', ')}. Calcule le montant total d'argent gagné.",
          solution: prices.map{|p| p[:unit_price] * p[:quantity]}.sum
        }
      end
    end
  end
end
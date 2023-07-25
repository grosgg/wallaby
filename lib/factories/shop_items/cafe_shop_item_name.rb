module Factories
  module ShopItems
    class Cafe
      extend Factories::Base

      NAMES = %w(
        cafés\ espresso
        cafés\ allongés
        cafés\ au\ lait
        chocolats\ chauds
        thés\ au\ citron
        thés\ à\ la\ menthe
        panachés
        monacos
        bières
        pastis
        diabolos\ menthe
        diabolos\ fraise
        ballons\ de\ blanc
        ballons\ de\ rouge
      ).freeze
      SHOP = "Le café"
      PRICE_RANGE = [250, 450]
    end
  end
end
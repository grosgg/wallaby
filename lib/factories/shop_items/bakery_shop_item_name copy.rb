module Factories
  module ShopItems
    class Bakery
      extend Factories::Base

      NAMES = %w(
        baguettes
        croissants
        pains\ au\ chocolat
        escargots
        chaussons\ aux\ pommes
        pépitos
        tartelettes\ aux\ fraises
        tartelettes\ à\ la\ poire
      ).freeze
      SHOP = "La boulangerie"
      PRICE_RANGE = [200, 450]
    end
  end
end
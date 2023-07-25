module Factories
  module ShopItems
    class Diy
      extend Factories::Base

      NAMES = %w(
        marteaux
        planches
        tournevis
        scies
        pinceaux
        pots\ de\ colle
        pots\ de\ peinture
        boîte\ de\ clous
        boîte\ de\ vis
        paires\ de\ gants
        casques
      ).freeze
      SHOP = "Le magasin de bricolage"
      PRICE_RANGE = [500, 2000]
    end
  end
end
module Factories
  class PlaceName
    extend Factories::Base

    NAMES = [
      "l'école",
      "la poste",
      "la mairie",
      "la plage",
      "la bibliothèque",
      "la pharmacie",
      "la piscine",
      "la boulangerie"
    ].freeze
  end
end
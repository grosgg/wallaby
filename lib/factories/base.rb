module Factories
  module Base
    NAMES = [].freeze

    def get(count = 1, names = self::NAMES)
      names.sample(count)
    end
  end
end
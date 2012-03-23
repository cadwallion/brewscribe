module Brewscribe
  class Hops
    attr_reader :name, :origin, :alpha, :beta, :notes, :boil_time, :percent,
      :amount, :hsi, :dry_hop_time, :ibu_contrib, :use, :in_recipe, :price,
      :type, :form

    include Brewscribe::Conversion

    KEY_CONVERSION = {
      alpha: FLOAT_CONV,
      beta: FLOAT_CONV,
      boil_time: ->(k) { k.to_i },
      percent: PERCENT_CONV,
      amount: FLOAT_CONV,
      hsi: FLOAT_CONV,
      dry_hop_time: ->(k) { k.to_i },
      ibu_contrib: PERCENT_CONV,
      use: ->(k) { USES[k.to_i] },
      type: ->(k) { TYPES[k.to_i] },
      form: ->(k) { FORMS[k.to_i] },
      in_recipe: BOOLEAN_CONV,
      price: FLOAT_CONV
    }

    TYPES = ['Bittering', 'Aroma', 'Both']
    FORMS = ['Pellet', 'Plug', 'Leaf']
    USES = ['Boil', 'Dry Hop', 'Mash', 'First Wort', 'Aroma']

    def initialize data
      @original_data = data   
      data_to_properties data
    end
  end
end

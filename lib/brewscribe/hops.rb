module Brewscribe
  class Hops
    attr_accessor :name, :origin, :alpha, :beta, :notes, :boil_time, :percent,
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
      parse_data
    end

    def parse_data
      @original_data.each_key do |key|
        if KEY_CONVERSION.has_key? key
          value = KEY_CONVERSION[key].call(@original_data[key])
        else
          value = @original_data[key]
        end
         
        self.instance_variable_set "@#{key}".to_sym, value
      end
    end
  end
end

module Brewscribe
  class Grain
    attr_accessor :name, :origin, :amount, :color, :yield, :percent, :price,
      :recommend_mash, :in_recipe, :type, :add_after_boil, :notes, :boil_time,
      :max_in_batch, :ibu_gal_per_lb, :protein, :diastatic_power, :late_extract,
      :convert_grain, :moisture, :coarse_fine_diff, :convert_grain, :supplier

    BOOLEAN_CONV = ->(k) { k == '1' }
    FLOAT_CONV = ->(k) { k.to_f }
    PERCENT_CONV = ->(k) { k.to_f * 0.001 }

    TYPES = ['Grain', 'Extract Sugar', 'Adjunct', 'Dry Extract']

    KEY_CONVERSION = {
      amount: FLOAT_CONV,
      color: FLOAT_CONV,
      yield: PERCENT_CONV,
      price: FLOAT_CONV,
      boil_time: FLOAT_CONV,
      percent: PERCENT_CONV,
      max_in_batch: PERCENT_CONV,
      add_after_boil: BOOLEAN_CONV,
      recommend_mash: BOOLEAN_CONV,
      in_recipe: BOOLEAN_CONV,
      type: ->(k) { TYPES[k.to_i] },
      ibu_gal_per_lb: FLOAT_CONV,
      protein: PERCENT_CONV,
      diastatic_power: PERCENT_CONV,
      late_extract: FLOAT_CONV,
      moisture: PERCENT_CONV,
      coarse_fine_diff: PERCENT_CONV
    }

    def initialize grain_data
      @original_data = grain_data 

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

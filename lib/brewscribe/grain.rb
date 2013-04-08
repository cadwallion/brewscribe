require 'brewscribe/conversion'

module Brewscribe
  class Grain
    attr_reader :name, :origin, :amount, :color, :yield, :percent, :price,
      :recommend_mash, :in_recipe, :type, :add_after_boil, :notes, :boil_time,
      :max_in_batch, :ibu_gal_per_lb, :protein, :diastatic_power, :late_extract,
      :convert_grain, :moisture, :coarse_fine_diff, :convert_grain, :supplier

    include Brewscribe::Conversion

    TYPES = ['Grain', 'Extract Sugar', 'Adjunct', 'Dry Extract']

    KEY_CONVERSION = {
      amount: FLOAT_CONV,
      color: FLOAT_CONV,
      yield: ->(k) { k.to_f * 0.01 },
      price: FLOAT_CONV,
      boil_time: ->(k) { k.to_i },
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

      data_to_properties grain_data
    end

    def ppg
      self.yield * 46.214
    end

    def total_ppg
      ppg * in_pounds
    end

    def in_pounds
      self.amount / 16.0
    end
  end
end

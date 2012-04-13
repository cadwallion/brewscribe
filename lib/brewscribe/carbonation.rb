module Brewscribe
  class Carbonation
    attr_accessor :name, :temperature, :type, :primer_name, :carb_rate, 
      :notes, :last_modified

    include Brewscribe::Conversion

    TYPES = ['Bottle', 'Keg', 'Keg with priming agent']
    KEY_CONVERSION = {
      carb_rate: PERCENT_CONV,
      temperature: FLOAT_CONV,
      type: ->(t) { TYPES[t.to_i] },
      last_modified: DATE_CONV
    }

    def self.from_data data
      carb = new
      carb.data_to_properties data  

      carb
    end
  end
end

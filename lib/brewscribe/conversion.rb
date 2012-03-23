module Brewscribe
  module Conversion
    BOOLEAN_CONV = ->(k) { k == '1' }
    FLOAT_CONV = ->(k) { k.to_f }
    PERCENT_CONV = ->(k) { k.to_f * 0.001 }
    INT_CONV = ->(k) { k.to_i }
    DATE_CONV = ->(k) { Date.parse k }


    def data_to_properties data
      data.each_key do |key|
        if self.class.const_get(:KEY_CONVERSION).has_key? key
          value = self.class.const_get(:KEY_CONVERSION)[key].call(data[key])
        else
          value = data[key]
        end

        self.instance_variable_set "@#{key}".to_sym, value
      end
    end
  end
end

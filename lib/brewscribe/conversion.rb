module Brewscribe
  module Conversion
    BOOLEAN_CONV = ->(k) { k == '1' }
    FLOAT_CONV = ->(k) { k.to_f }
    PERCENT_CONV = ->(k) { k.to_f * 0.001 }
  end
end

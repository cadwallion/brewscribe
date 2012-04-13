module Brewscribe
  class Style
    attr_accessor :last_modified, :name, :category, :guide, :letter, :number, 
      :type, :min_og, :max_og, :min_fg, :max_fg, :min_ibu, :max_ibu, :min_carb,
      :max_carb, :min_color, :max_color, :min_abv, :max_abv, :description, 
      :profile, :ingredients, :examples, :web_link 

    include Brewscribe::Conversion

    TYPES = ['Ale', 'Lager', 'Mixed', 'Mead', 'Cider', 'Wheat']

    KEY_CONVERSION = {
      last_modified: DATE_CONV,
      min_og: FLOAT_CONV,
      max_og: FLOAT_CONV,
      min_fg: FLOAT_CONV,
      max_fg: FLOAT_CONV,
      number: INT_CONV,
      min_ibu: FLOAT_CONV,
      max_ibu: FLOAT_CONV,
      letter: ->(k) { Array('A'..'Z')[k.to_i-1] },
      type: ->(k) { TYPES[k.to_i] },
      min_abv: PERCENT_CONV,
      max_abv: PERCENT_CONV,
      min_color: FLOAT_CONV,
      max_color: FLOAT_CONV,
      examples: ->(k) { k.split(', ') }
    }

    def self.from_data data
      style = new
      style.data_to_properties data

      style
    end
  end
end

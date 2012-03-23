module Brewscribe
  class Yeast
    attr_reader :name, :lab, :product_id, :flocculation, :type, :form, 
      :starter_size, :amount, :price, :in_recipe, :brew_date, :pkg_date,
      :cells, :min_attenuation, :max_attenuation, :min_temp, :max_temp,
      :use_starter, :add_to_secondary, :times_cultured, :max_reuse,
      :culture_date, :best_for, :notes, :last_modified

    include Brewscribe::Conversion

    FLOCCULATION_TYPES = ['Low', 'Medium', 'High', 'Very High']
    TYPES = ['Ale', 'Lager', 'Wine', 'Champagne', 'Wheat']
    FORMS = ['Liquid', 'Dry', 'Slant', 'Culture']
    KEY_CONVERSION = {
      product_id: INT_CONV,
      flocculation: ->(k) { FLOCCULATION_TYPES[k.to_i] },
      type: ->(k) { TYPES[k.to_i] },
      last_modified: DATE_CONV,
      form: ->(k) { FORMS[k.to_i] },
      starter_size: FLOAT_CONV,
      amount: FLOAT_CONV,
      price: FLOAT_CONV,
      in_recipe: BOOLEAN_CONV,
      brew_date: DATE_CONV,
      pkg_date: DATE_CONV,
      cells: FLOAT_CONV,
      min_attenuation: PERCENT_CONV,
      max_attenuation: PERCENT_CONV,
      min_temp: FLOAT_CONV,
      max_temp: FLOAT_CONV,
      use_starter: BOOLEAN_CONV,
      add_to_secondary: BOOLEAN_CONV,
      times_cultured: INT_CONV,
      max_reuse: INT_CONV,
      culture_date: DATE_CONV
    }

    def initialize data
      @original_data = data

      data_to_properties data
    end
  end
end

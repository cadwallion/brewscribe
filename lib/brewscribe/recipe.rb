require 'nokogiri'

module Brewscribe
  class Recipe
    attr_reader :raw_data, :hash
    attr_accessor :age, :asst_brewer, :base_grain, :boil_vol_measured, :brewer, 
      :carb, :carb_vols, :color_adj_string, :date, :description, :desired_color, 
      :desired_ibu, :desired_og, :equipment, :fg_measured, :final_vol_measured,
      :image, :image_x, :image_y, :include_starter, :ingredients, :inv_date, 
      :last_modified, :locked, :mash, :mash_ph, :name, :notes, :og_boil_measured, 
      :og_measured, :og_primary, :og_secondary, :old_boil_vol, :old_efficiency, 
      :old_type, :old_vol, :rating, :rebalance_scale, :running_gravity,
      :runoff_ph, :starter_size, :stir_plate, :style, :type, :version, 
      :volume_measured

    include Brewscribe::Conversion

    TYPES = ['Extract', 'Partial Grain', 'All Grain']

    KEY_CONVERSION = {
      boil_vol_measured: FLOAT_CONV ,
      type: ->(t) { TYPES[t.to_i] },
      carb_vols: FLOAT_CONV,
      date: DATE_CONV,
      desired_ibu: FLOAT_CONV,
      desired_color: FLOAT_CONV,
      desired_og: FLOAT_CONV,
      fg_measured: FLOAT_CONV,
      final_vol_measured: FLOAT_CONV,
      include_starter: BOOLEAN_CONV,
      inv_date: DATE_CONV,
      last_modified: DATE_CONV,
      locked: BOOLEAN_CONV,
      mash_ph: FLOAT_CONV,
      og_boil_measured: FLOAT_CONV,
      og_measured: FLOAT_CONV,
      og_primary: FLOAT_CONV,
      og_secondary: FLOAT_CONV,
      old_boil_vol: FLOAT_CONV,
      old_efficiency: PERCENT_CONV,
      rating: FLOAT_CONV,
      rebalance_scale: BOOLEAN_CONV,
      running_gravity: FLOAT_CONV,
      runoff_ph: FLOAT_CONV,
      starter_size: FLOAT_CONV,
      stir_plate: BOOLEAN_CONV,
      version: FLOAT_CONV,
      volume_measured: FLOAT_CONV
    }

    alias_method :carbonation, :carb


    def initialize data = {}
      data_to_properties data

      # @TODO: Base Grain conversion
      self.ingredients = IngredientList.from_data self.ingredients[:data]
      self.mash = Mash.from_data self.mash
      self.equipment = Equipment.from_data self.equipment
      self.carb = Carbonation.from_data self.carb
      self.style = Style.from_data self.style
    end

    def abv
      (((1.05 * (self.og_measured - self.fg_measured)) / self.fg_measured) / 0.79 * 100).round(2)
    end

    def abw
      abv * 0.79336
    end

    def ibu
      ibus  = self.ingredients.hops.inject(0) do |sum, hop|
        sum + hop.ibu_contrib
      end

      (ibus * 1000).round(1)
    end

    def srm
      volume_in_gallons = equipment.batch_vol / 128.0
      mcu = ingredients.grains.inject(0.0) do |sum, grain|
        grain_in_pounds = grain.amount / 16.0
        sum + ((grain.color * grain_in_pounds) / volume_in_gallons)
      end

      (1.4922 * (mcu ** 0.6859)).round(1)
    end
  end
end

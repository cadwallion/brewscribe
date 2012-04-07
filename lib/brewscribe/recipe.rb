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
      :old_type, :old_vol, :rating, :raw_data, :rebalance_scale, :running_gravity,
      :runoff_ph, :starter_size, :stir_plate, :style, :type, :version, 
      :volume_measured

    def initialize data = {}
      data.keys.each do |key|
        self.send "#{key}=", data[key]
      end     

      self.ingredients = IngredientList.from_data self.ingredients[:data]
      self.mash = Mash.from_data self.mash
    end
  end
end

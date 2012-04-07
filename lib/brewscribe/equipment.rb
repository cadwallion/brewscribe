module Brewscribe
  class Equipment
    attr_accessor :last_modified, :name, :mash_vol, :tun_mass, :boil_rate_flag,
      :tun_specific_heat, :tun_deadspace, :tun_adj_deadspace, :calc_boil, :boil_vol,
      :boil_time, :old_evap_rate, :equip_39, :boil_off, :trub_loss, :cool_pct, 
      :top_up_kettle, :batch_vol, :fermenter_loss, :top_up, :efficiency, :hop_util,
      :notes
   
    include Brewscribe::Conversion

    KEY_CONVERSION = {
      last_modified: DATE_CONV,
      mash_vol: FLOAT_CONV,
      tun_mass: FLOAT_CONV,
      boil_rate_flag: BOOLEAN_CONV,
      boil_time: FLOAT_CONV,
      tun_specific_heat: FLOAT_CONV,
      tun_deadspace: FLOAT_CONV,
      tun_adj_deadspace: FLOAT_CONV,
      calc_boil: BOOLEAN_CONV,
      boil_vol: FLOAT_CONV,
      old_evap_rate: PERCENT_CONV,
      equip_39: BOOLEAN_CONV,
      boil_off: FLOAT_CONV,
      trub_loss: FLOAT_CONV,
      cool_pct: PERCENT_CONV,
      top_up_kettle: FLOAT_CONV,
      batch_vol: FLOAT_CONV,
      fermenter_loss: FLOAT_CONV,
      top_up: FLOAT_CONV,
      efficiency: PERCENT_CONV,
      hop_util: PERCENT_CONV
    }

    def self.from_data data
      equipment = new 
      equipment.data_to_properties data

      equipment
    end
  end
end

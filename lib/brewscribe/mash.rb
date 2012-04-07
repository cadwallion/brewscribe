require 'brewscribe/mash/step'

module Brewscribe
  class Mash
    attr_accessor :last_modified, :name, :grain_weight, :grain_temp, :boil_temp,
      :tun_temp, :ph, :sparge_temp, :batch, :batch_pct, :batch_even, :batch_drain, 
      :mash_39, :tun_deadspace, :biab_vol, :biab, :notes, :steps, :equip_adjust, 
      :tun_vol, :tun_mass, :tun_hc

    include Brewscribe::Conversion
    
    KEY_CONVERSION = {
      last_modified: DATE_CONV,
      grain_weight: FLOAT_CONV,
      grain_temp: FLOAT_CONV,
      boil_temp: FLOAT_CONV,
      tun_temp: FLOAT_CONV,
      ph: FLOAT_CONV,
      sparge_temp: FLOAT_CONV,
      batch: FLOAT_CONV,
      batch_pct: PERCENT_CONV,
      batch_even: BOOLEAN_CONV,
      batch_drain: BOOLEAN_CONV,
      mash_39: BOOLEAN_CONV,
      tun_deadspace: FLOAT_CONV,
      biab_vol: FLOAT_CONV,
      biab: BOOLEAN_CONV,
      equip_adjust: BOOLEAN_CONV,
      tun_vol: FLOAT_CONV,
      tun_mass: FLOAT_CONV,
      tun_hc: FLOAT_CONV
    }
    
    def self.from_data data 
      mash = new
      mash.data_to_properties data
      
      if mash.steps[:data][:mashstep].class == Hash
        steps = [mash.steps[:data][:mashstep]]
      else
        steps = mash.steps[:data][:mashstep]
      end

      mash.steps = []
      steps.each do |step|
        mash.steps << Brewscribe::Mash::Step.from_data(step)  
      end

      mash
    end
  end
end

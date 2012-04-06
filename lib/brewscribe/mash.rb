require 'brewscribe/mash/step'

module Brewscribe
  class Mash
    attr_accessor :last_modified, :name, :grain_weight, :grain_temp, :boil_temp,
      :tun_temp, :ph, :sparge_temp, :batch, :batch_pct, :batch_even, :batch_drain, 
      :mash_39, :tun_deadspace, :biab_vol, :biab, :notes, :steps, :equip_adjust, 
      :tun_vol, :tun_mass, :tun_hc
    
    def self.from_data data 
      mash = new

      data.keys.each do |key|
        mash.send "#{key}=", data[key]
      end
      
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

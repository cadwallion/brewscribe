module Brewscribe
  class Mash
    class Step
      attr_accessor :last_modified, :name, :type, :infusion, :step_temp, :step_time,
        :rise_time, :tun_addition, :tun_hc, :tun_vol, :tun_temp, :tun_mass, 
        :start_temp, :grain_temp, :start_vol, :grain_weight, :infusion_temp,
        :decoction_amt

      def self.from_data data
        step = new 

        data.keys.each do |key|
          step.send "#{key}=", data[key]
        end

        step
      end
    end
  end
end

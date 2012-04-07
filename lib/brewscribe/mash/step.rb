module Brewscribe
  class Mash
    class Step
      attr_accessor :last_modified, :name, :type, :infusion, :step_temp, :step_time,
        :rise_time, :tun_addition, :tun_hc, :tun_vol, :tun_temp, :tun_mass, 
        :start_temp, :grain_temp, :start_vol, :grain_weight, :infusion_temp,
        :decoction_amt

      include Brewscribe::Conversion

      TYPES = ['Infusion', 'Decoction', 'Temperature']

      KEY_CONVERSION = {
        last_modified: DATE_CONV,
        type: ->(t) { TYPES[t.to_i] },
        infusion: FLOAT_CONV,
        step_temp: FLOAT_CONV,
        step_time: INT_CONV,
        rise_time: INT_CONV,
        tun_addition: FLOAT_CONV,
        tun_vol: FLOAT_CONV,
        tun_temp: FLOAT_CONV,
        tun_mass: FLOAT_CONV,
        start_temp: FLOAT_CONV,
        grain_temp: FLOAT_CONV,
        start_vol: FLOAT_CONV,
        grain_weight: FLOAT_CONV,
        infusion_temp: FLOAT_CONV,
        decoction_amt: FLOAT_CONV,
        tun_hc: FLOAT_CONV
      }

      def self.from_data data
        step = new 
        step.data_to_properties data
        
        step
      end
    end
  end
end

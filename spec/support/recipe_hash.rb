RECIPE_HASH = {
  equipment: {
    :last_modified=>"1978-12-22", :name=>"Pot ( 4 Gal/15.1 L) - Extract", 
    :mash_vol=>"512.0000000", :tun_mass=>"64.0000000", :boil_rate_flag=>"1",
    :tun_specific_heat=>"0.1200000", :tun_deadspace=>"0.0000000", 
    :tun_adj_deadspace=>"1", :calc_boil=>"1", :boil_vol=>"469.7600000", 
    :boil_time=>"60.0000000", :old_evap_rate=>"9.0000000", :equip_39=>"1", 
    :boil_off=>"37.1200000", :trub_loss=>"64.0000000", :cool_pct=>"4.0000000", 
    :top_up_kettle=>"0.0000000", :batch_vol=>"640.0000000", 
    :fermenter_loss=>"51.2000000", :top_up=>"288.0000000", :efficiency=>"72.0000000",
    :hop_util=>"100.0000000", 
    :notes=>"Simple Brew Pot with a 4 Gallon Capacity - leaving a workable boil volume of around 3.25 gal.  Used for extract or partial mash brewing."
  },
  mash: {
    :last_modified=>"1978-12-22", :name=>"Single Infusion, Light Body, No Mash Out",
    :grain_weight=>"72.0000000", :grain_temp=>"72.0000000",
    :boil_temp=>"212.0000000", :tun_temp=>"72.0000000", :ph=>"5.4000000",
    :sparge_temp=>"168.0000000", :batch=>"0", :batch_pct=>"100.0000000", 
    :batch_even=>"0", :batch_drain=>"0", :mash_39=>"1", :tun_deadspace=>"0.0000000",
    :biab_vol=>"640.0000000", :biab=>"0", 
    :notes=>"Simple single infusion mash for use with most modern well modified grains (about 95% of the time).",
    :steps=> {
      :last_modified=>"2012-03-14", 
      :name=>"steps", 
      :type=>"7432", 
      :owndata=>"1", 
      :tid=>"7149", 
      :size=>"1", 
      :_xname=>"steps", 
      :allocinc=>"16", 
      :data=>{
        :mashstep=>{
          :last_modified=>"2012-03-12", 
          :name=>"Mash In", 
          :type=>"0", 
          :infusion=>"180.0000000", 
          :step_temp=>"148.0000000", 
          :step_time=>"75.0000000", 
          :rise_time=>"2.0000000", 
          :tun_addition=>"0.0000000",
          :tun_hc=>"0.1200000", 
          :tun_vol=>"512.0000000", 
          :tun_temp=>"72.0000000", 
          :tun_mass=>"0.0000000", 
          :start_temp=>"0.0000000", 
          :grain_temp=>"72.0000000", 
          :start_vol=>"0.0000000", 
          :grain_weight=>"72.0000000", 
          :infusion_temp=>"159.0738063", 
          :decoction_amt=>"0.0000000"
        }
      }, 
      :_texpanded=>"1"
    }, 
    :equip_adjust=>"0", 
    :tun_vol=>"512.0000000", 
    :tun_mass=>"64.0000000", 
    :tun_hc=>"0.1200000"
  },
  :carb => {
    :last_modified=>"1978-12-30",
    :name=>"Corn Sugar",
    :temperature=>"70.0000000",
    :type=>"0", :primer_name=>"Corn Sugar",
    :carb_rate=>"100.0000000",
    :notes=>"Use corn sugar for priming the beer"
  }
}

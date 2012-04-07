require 'spec_helper'

describe Brewscribe::Equipment do
  subject { Brewscribe::Equipment.from_data RECIPE_HASH[:equipment] }

  it { subject.should be_a Brewscribe::Equipment }
  it { subject.last_modified.should be_a Date }
  it { subject.mash_vol.should be_a Float }
  it { subject.tun_mass.should be_a Float }
  it { subject.boil_time.should be_a Float }
  it { subject.tun_specific_heat.should be_a Float }
  it { subject.tun_deadspace.should be_a Float }
  it { subject.tun_adj_deadspace.should be_a Float }
  it { subject.boil_vol.should be_a Float }
  it { subject.old_evap_rate.should be_a Float }
  it { subject.boil_off.should be_a Float }
  it { subject.trub_loss.should be_a Float }
  it { subject.cool_pct.should be_a Float }
  it { subject.top_up_kettle.should be_a Float }
  it { subject.batch_vol.should be_a Float }
  it { subject.fermenter_loss.should be_a Float }
  it { subject.top_up.should be_a Float }
  it { subject.efficiency.should be_a Float }
  it { subject.hop_util.should be_a Float }

  it 'boil_rate_flag should be a boolean' do
    [true, false].should include subject.boil_rate_flag
  end

  it 'calc_boil should be a boolean' do
    [true, false].should include subject.calc_boil
  end

  it 'equip_39 should be a boolean' do
    [true, false].should include subject.equip_39
  end
end

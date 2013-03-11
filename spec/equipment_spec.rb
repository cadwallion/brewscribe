require 'spec_helper'

describe Brewscribe::Equipment do
  let(:document) { import_document }
  let(:recipe) { document.recipes.first }
  let(:equipment) { recipe.equipment }
  subject { equipment }

  it { should be_a Brewscribe::Equipment }

  its(:last_modified) { should be_a Date }
  its(:mash_vol) { should be_a Float }
  its(:tun_mass) { should be_a Float }
  its(:boil_time) { should be_a Float }
  its(:tun_specific_heat) { should be_a Float }
  its(:tun_deadspace) { should be_a Float }
  its(:tun_adj_deadspace) { should be_a Float }
  its(:boil_vol) { should be_a Float }
  its(:old_evap_rate) { should be_a Float }
  its(:boil_off) { should be_a Float }
  its(:trub_loss) { should be_a Float }
  its(:cool_pct) { should be_a Float }
  its(:top_up_kettle) { should be_a Float }
  its(:batch_vol) { should be_a Float }
  its(:fermenter_loss) { should be_a Float }
  its(:top_up) { should be_a Float }
  its(:efficiency) { should be_a Float }
  its(:hop_util) { should be_a Float }
  its(:boil_rate_flag) { should be_boolean }
  its(:calc_boil) { should be_boolean }
  its(:equip_39) { should be_boolean }
end

require 'spec_helper'

describe Brewscribe::Mash do
  describe '#from_data' do
    let(:document) { import_document }
    let(:recipe) { document.recipes.first }
    let(:mash) { recipe.mash }
    subject { mash }

    it { should be_a Brewscribe::Mash }
    its(:name) { should == 'Single Infusion, Light Body, No Mash Out' }
    its(:steps) { should be_a Array }

    it 'converts steps into an array of Mash::Step objects' do
      mash.steps[0].should be_a Brewscribe::Mash::Step
    end

    its(:grain_weight) { should be_a Float }
    its(:grain_temp) { should be_a Float }
    its(:boil_temp) { should be_a Float }
    its(:tun_temp) { should be_a Float }
    its(:sparge_temp) { should be_a Float }
    its(:ph) { should be_a Float }
    its(:batch) { should be_a Float }
    its(:batch_pct) { should be_a Float }
    its(:tun_deadspace) { should be_a Float }
    its(:biab_vol) { should be_a Float }
    its(:tun_vol) { should be_a Float }
    its(:tun_mass) { should be_a Float }
    its(:tun_hc) { should be_a Float }
    its(:last_modified) { should be_a Date }

    its(:batch_even) { should be_boolean }
    its(:batch_drain) { should be_boolean }
    its(:mash_39) { should be_boolean }
    its(:biab) { should be_boolean }
    its(:equip_adjust) { should be_boolean }
  end
end

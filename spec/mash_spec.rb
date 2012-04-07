require 'spec_helper'

describe Brewscribe::Mash do
  describe '#from_data' do
    let(:data) { RECIPE_HASH[:mash] }
    subject { Brewscribe::Mash.from_data(data) }

    it 'returns a Mash object with data preloaded' do
      subject.should be_a Brewscribe::Mash 
      subject.name.should == RECIPE_HASH[:mash][:name]
    end

    it 'converts steps into an array of Mash::Step objects' do
      subject.steps.should be_a Array
      subject.steps[0].should be_a Brewscribe::Mash::Step
    end

    it { subject.grain_weight.should be_a Float }
    it { subject.grain_temp.should be_a Float }
    it { subject.boil_temp.should be_a Float }
    it { subject.tun_temp.should be_a Float }
    it { subject.sparge_temp.should be_a Float }
    it { subject.ph.should be_a Float }
    it { subject.batch.should be_a Float }
    it { subject.batch_pct.should be_a Float }
    it { subject.tun_deadspace.should be_a Float }
    it { subject.biab_vol.should be_a Float }
    it { subject.tun_vol.should be_a Float }
    it { subject.tun_mass.should be_a Float }
    it { subject.tun_hc.should be_a Float }
    it { subject.last_modified.should be_a Date }

    it 'batch_even should be a boolean' do
      [true, false].should include subject.batch_even
    end

    it 'batch_drain should be a boolean' do
      [true, false].should include subject.batch_drain
    end

    it 'mash_39 should be a boolean' do
      [true, false].should include subject.mash_39
    end

    it 'biab should be a boolean' do
      [true, false].should include subject.biab
    end

    it 'equip_adjust should be a boolean' do
      [true, false].should include subject.equip_adjust
    end
  end
end

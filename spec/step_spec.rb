require 'spec_helper'

describe Brewscribe::Mash::Step do
  describe '#from_data' do
    let(:mashstep) { RECIPE_HASH[:mash][:steps][:data][:mashstep] }
    subject { Brewscribe::Mash::Step.from_data mashstep }
    
    it { subject.should be_a Brewscribe::Mash::Step }
    it { subject.last_modified.should be_a Date }
    it { subject.infusion.should be_a Float }
    it { subject.step_temp.should be_a Float }
    it { subject.tun_addition.should be_a Float }
    it { subject.tun_hc.should be_a Float }
    it { subject.tun_vol.should be_a Float }
    it { subject.tun_temp.should be_a Float }
    it { subject.tun_mass.should be_a Float }
    it { subject.start_temp.should be_a Float }
    it { subject.grain_temp.should be_a Float }
    it { subject.start_vol.should be_a Float }
    it { subject.grain_weight.should be_a Float }
    it { subject.infusion_temp.should be_a Float }
    it { subject.decoction_amt.should be_a Float }
    it { subject.step_time.should be_a Fixnum }
    it { subject.rise_time.should be_a Fixnum }

    it 'should set the type to one of the TYPES' do
      Brewscribe::Mash::Step::TYPES.should include subject.type
    end
  end
end

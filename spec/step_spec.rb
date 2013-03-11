require 'spec_helper'

describe Brewscribe::Mash::Step do
  describe '#from_data' do
    let(:document) { import_document }
    let(:recipe) { document.recipes.first }
    let(:mashstep) { recipe.mash.steps[0] }
    subject { mashstep }
    
    it { should be_a Brewscribe::Mash::Step }
    its(:last_modified) { should be_a Date }
    its(:infusion) { should be_a Float }
    its(:step_temp) { should be_a Float }
    its(:tun_addition) { should be_a Float }
    its(:tun_hc) { should be_a Float }
    its(:tun_vol) { should be_a Float }
    its(:tun_temp) { should be_a Float }
    its(:tun_mass) { should be_a Float }
    its(:start_temp) { should be_a Float }
    its(:grain_temp) { should be_a Float }
    its(:start_vol) { should be_a Float }
    its(:grain_weight) { should be_a Float }
    its(:infusion_temp) { should be_a Float }
    its(:decoction_amt) { should be_a Float }
    its(:step_time) { should be_a Fixnum }
    its(:rise_time) { should be_a Fixnum }

    its(:type) { should be_one_of Brewscribe::Mash::Step::TYPES }
  end
end

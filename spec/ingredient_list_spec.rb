require 'spec_helper'

describe Brewscribe::IngredientList do
  describe '#from_data' do
    subject { Brewscribe::IngredientList.from_data({grain: [{}], hops: [{}] }) }

    it 'should set the grains to an array of Grains' do
      subject.grains.should be_a Array
      subject.grains[0].should be_a Brewscribe::Grain
    end

    it 'should set the yeast to an empty array' do
      subject.yeast.should be_a Array
    end

    it 'should set the hops to an empty array of Hops' do
      subject.hops.should be_a Array
      subject.hops[0].should be_a Brewscribe::Hops
    end
  end

  describe '#add_grain' do
    let(:grain_data) { { name: 'Pale Malt' } }
    
    it 'should add a Brewscribe::Grain object to grains' do
      subject.add_grain grain_data
      subject.grains[0].should be_a Brewscribe::Grain
      subject.grains[0].name.should == 'Pale Malt'
    end
  end

  describe '#add_hops' do
    let(:hop_data) { { name: 'Williamette' } }
    
    it 'should add a Brewscribe::Hops object to hops' do
      subject.add_hops hop_data
      subject.hops[0].should be_a Brewscribe::Hops
      subject.hops[0].name.should == 'Williamette'
    end
  end
end

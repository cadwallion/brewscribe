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
  end
end

require 'spec_helper'

describe Brewscribe::Carbonation do
  subject { Brewscribe::Carbonation.from_data RECIPE_HASH[:carb] }

  describe '#from_data' do
    it { subject.should be_a Brewscribe::Carbonation }

    it { subject.carb_rate.should be_a Float }
    it { subject.temperature.should be_a Float }
    it { subject.last_modified.should be_a Date }


    it 'should set the type to one of the TYPES' do
      Brewscribe::Carbonation::TYPES.should include subject.type
    end
  end
end

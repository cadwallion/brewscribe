require 'spec_helper'

describe Brewscribe::IngredientList do
  describe '#from_data' do
    subject { Brewscribe::IngredientList.from_data({}) }

    it 'should set the grains to an array' do
      subject.grains.should be_a Array
    end

    it 'should set the yeast to an empty array' do
      subject.yeast.should be_a Array
    end

    it 'should set the hops to an empty array' do
      subject.hops.should be_a Array
    end
  end
end

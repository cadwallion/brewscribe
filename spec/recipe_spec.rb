require 'spec_helper'

describe Brewscribe::Recipe do
  describe '#parse_raw_data' do
    let(:recipe_file) { File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r') }
    subject { Brewscribe::Recipe.new(recipe_file.read) }
    it 'should convert the recipe data into properties' do
      subject.brewer.should == 'CadBrew'
    end

    it 'should return a hash for nested recipe attributes' do
      subject.equipment.should be_a Hash
      subject.equipment[:name].should be_a String
    end
  end
end

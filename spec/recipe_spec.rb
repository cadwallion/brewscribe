require 'spec_helper'

describe Brewscribe::Recipe do
  let(:recipe_file) { File.read(File.dirname(__FILE__) + '/support/recipe.bsmx') }
  let(:data) { Brewscribe::Document.new(data: recipe_file).parse.hash[:recipe] }
  subject { Brewscribe::Recipe.new(data) }
  it 'should convert the recipe data into properties' do
    subject.brewer.should == 'CadBrew'
  end

  it 'should return a hash for nested recipe attributes' do
    subject.equipment.should be_a Hash
    subject.equipment[:name].should be_a String
  end

  it 'should contain an IngredientsList' do
    subject.ingredients.should be_a Brewscribe::IngredientList
  end
end

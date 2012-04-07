require 'spec_helper'

describe Brewscribe::Recipe do
  let(:recipe_file) { File.read(File.dirname(__FILE__) + '/support/recipe.bsmx') }
  let(:data) { Brewscribe::Document.new(data: recipe_file).hash[:recipe] }
  subject { Brewscribe::Recipe.new(data) }
  it 'should convert the recipe data into properties' do
    subject.brewer.should == 'CadBrew'
  end

  it 'should convert equipment to an Equipment object' do
    subject.equipment.should be_a Brewscribe::Equipment
  end

  it 'should convert mash into a Mash object' do
    subject.mash.should be_a Brewscribe::Mash
  end

  it 'should contain an IngredientsList' do
    subject.ingredients.should be_a Brewscribe::IngredientList
  end
end

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

  it 'should convert style into a Style object' do
    subject.style.should be_a Brewscribe::Style
  end

  it 'should convert carb into a Carbonation object' do
    subject.carb.should be_a Brewscribe::Carbonation
    subject.carbonation.should be_a Brewscribe::Carbonation
  end

  it 'should contain an IngredientsList' do
    subject.ingredients.should be_a Brewscribe::IngredientList
  end

  its(:boil_vol_measured) { should be_a Float }
  its(:carb_vols) { should be_a Float }
  its(:desired_ibu) {should be_a Float }
  its(:desired_color) { should be_a Float }
  its(:desired_og) { should be_a Float }
  its(:fg_measured) { should be_a Float }
  its(:mash_ph) { should be_a Float }
  its(:og_boil_measured) { should be_a Float }
  its(:og_measured) { should be_a Float }
  its(:og_primary) { should be_a Float }
  its(:og_secondary) { should be_a Float }
  its(:old_boil_vol) { should be_a Float }
  its(:old_efficiency) { should be_a Float }
  its(:running_gravity) { should be_a Float }
  its(:runoff_ph) { should be_a Float }
  its(:starter_size) { should be_a Float }
  its(:rating) { should be_a Float }
  its(:version) { should be_a Float }
  its(:volume_measured) { should be_a Float }
  its(:date) { should be_a Date }
  its(:inv_date) { should be_a Date }
  its(:last_modified) { should be_a Date }

  it 'should set the type to one of the TYPES' do
    Brewscribe::Recipe::TYPES.should include subject.type
  end

  it 'should set include_starter to boolean' do
    [true, false].should include subject.include_starter
  end

  it 'should set locked to boolean' do
    [true, false].should include subject.locked
  end

  it 'should set rebalance_scale to boolean' do
    [true, false].should include subject.rebalance_scale
  end

  it 'should set stir_plate to boolean' do
    [true, false].should include subject.stir_plate
  end

  its(:ibu) { should == 65.1 }
end

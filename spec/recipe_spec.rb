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

  it { subject.boil_vol_measured.should be_a Float }
  it { subject.carb_vols.should be_a Float }
  it { subject.desired_ibu.should be_a Float }
  it { subject.desired_color.should be_a Float }
  it { subject.desired_og.should be_a Float }
  it { subject.fg_measured.should be_a Float }
  it { subject.mash_ph.should be_a Float }
  it { subject.og_boil_measured.should be_a Float }
  it { subject.og_measured.should be_a Float }
  it { subject.og_primary.should be_a Float }
  it { subject.og_secondary.should be_a Float }
  it { subject.old_boil_vol.should be_a Float }
  it { subject.old_efficiency.should be_a Float }
  it { subject.running_gravity.should be_a Float }
  it { subject.runoff_ph.should be_a Float }
  it { subject.starter_size.should be_a Float }
  it { subject.rating.should be_a Float }
  it { subject.version.should be_a Float }
  it { subject.volume_measured.should be_a Float }
  it { subject.date.should be_a Date }
  it { subject.inv_date.should be_a Date }
  it { subject.last_modified.should be_a Date }

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

  context 'calculation methods' do
    its(:og_measured) { should == 1.046 }
    its(:fg_measured) { should == 1.010 }
    its(:abv) { should == 4.74 }
  end
end

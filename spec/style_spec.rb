#encoding: UTF-8
require 'spec_helper'

describe Brewscribe::Style do
  subject { Brewscribe::Style.from_data RECIPE_HASH[:style] } 
  it {subject.name.should == 'Oktoberfest/Märzen'}
  it { subject.should be_a Brewscribe::Style }
  it { subject.last_modified.should be_a Date }
  it { subject.min_og.should be_a Float }
  it { subject.max_og.should be_a Float }
  it { subject.min_fg.should be_a Float }
  it { subject.max_fg.should be_a Float }
  it { subject.min_ibu.should be_a Float }
  it { subject.max_ibu.should be_a Float }
  it { subject.min_abv.should be_a Float }
  it { subject.max_abv.should be_a Float }
  it { subject.min_color.should be_a Float }
  it { subject.max_color.should be_a Float }
  it { subject.number.should be_a Fixnum }
  it { subject.letter.should == 'F' }
  let(:document) { import_document }
  let(:recipe) { document.recipes.first }
  subject { recipe.style } 

  it { should be_a Brewscribe::Style }
  its(:last_modified) { should be_a Date }
  its(:min_og) { should be_a Float }
  its(:max_og) { should be_a Float }
  its(:min_fg) { should be_a Float }
  its(:max_fg) { should be_a Float }
  its(:min_ibu) { should be_a Float }
  its(:max_ibu) { should be_a Float }
  its(:min_abv) { should be_a Float }
  its(:max_abv) { should be_a Float }
  its(:min_color) { should be_a Float }
  its(:max_color) { should be_a Float }
  its(:number) { should be_a Fixnum }
  its(:letter) { should == 'F' }

  its(:examples) { should be_a Array }
  its(:examples) { should have(17).examples }

  it 'should set the type to one of the TYPES' do
    Brewscribe::Style::TYPES.should include subject.type
  end
end

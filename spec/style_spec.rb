require 'spec_helper'

describe Brewscribe::Style do
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

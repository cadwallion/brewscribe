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

  it 'examples should be an array of beer names' do
    subject.examples.should be_a Array
    subject.examples.should have(17).examples
  end

  it 'should set the type to one of the TYPES' do
    Brewscribe::Style::TYPES.should include subject.type
  end
end

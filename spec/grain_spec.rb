require 'spec_helper'

describe Brewscribe::Grain do
  let(:data) { {:last_modified=>"1978-12-31", 
    :name=>"Pale Malt (2 Row) US", :origin=>"US", 
    :supplier=>nil, :type=>"0", :in_recipe=>"1", 
    :inventory=>"0.0000000", :amount=>"32.0000000", 
    :color=>"2.0000000", :yield=>"79.0000000", 
    :late_extract=>"0.0000000", :percent=>"12.1212121", 
    :order=>"1", :coarse_fine_diff=>"1.5000000", 
    :moisture=>"4.0000000", :diastatic_power=>"140.0000000", 
    :protein=>"12.3000000", :ibu_gal_per_lb=>"0.0000000", 
    :add_after_boil=>"0", :recommend_mash=>"1", 
    :max_in_batch=>"100.0000000", :notes=>"Base malt for all beer styles", 
    :boil_time=>"60.0000000", :price=>"0.0800000", 
    :convert_grain=>"Pale Liquid Extract"} }

  subject { Brewscribe::Grain.new(data) }
  describe '#initialize' do
    it 'will set the hash into object properties' do
      subject.name.should == data[:name] 
    end

    it { subject.boil_time.should be_a Float }
    it { subject.percent.should be_a Float }
    it { subject.max_in_batch.should be_a Float }
    it { subject.amount.should be_a Float }
    it { subject.color.should be_a Float }
    it { subject.price.should be_a Float }
    it { subject.yield.should be_a Float }
    it { subject.protein.should be_a Float }
    it { subject.diastatic_power.should be_a Float }
    it { subject.late_extract.should be_a Float }
    it { subject.moisture.should be_a Float }
    it { subject.coarse_fine_diff.should be_a Float }

    it 'will convert recommend_mash to a Boolean' do
      subject.recommend_mash.should be_a TrueClass
    end

    it 'will convert add_after_boil to a Boolean' do
      subject.add_after_boil.should be_a FalseClass
    end

    it 'will convert in_recipe to a Boolean' do
      subject.in_recipe.should be_a TrueClass
    end

    it 'will convert type to a member of Brewscribe::Grain::TYPES' do
      Brewscribe::Grain::TYPES.should include subject.type
    end
    
  end
end

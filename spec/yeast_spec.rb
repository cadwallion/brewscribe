require 'spec_helper'

describe Brewscribe::Yeast do
  describe '#initialize' do
    let(:data) { { :last_modified=>"2012-03-14", :name=>"London ESB Ale", 
      :lab=>"Wyeast Labs", :product_id=>"1968", :type=>"0",
      :form=>"0", :flocculation=>"2", :starter_size=>"4.2000000",
      :amount=>"1.0000000", :inventory=>"0.0000000",
      :price=>"6.0000000", :order=>"10", :in_recipe=>"1",
      :brew_date=>"2012-03-12", :pkg_date=>"2011-02-27",
      :cells=>"100.0000000", :min_attenuation=>"67.0000000",
      :max_attenuation=>"71.0000000", :min_temp=>"64.0000000",
      :max_temp=>"72.0000000", :use_starter=>"0", 
      :add_to_secondary=>"0", :times_cultured=>"0",
      :max_reuse=>"5", :culture_date=>"2003-06-14", 
      :best_for=>"English Bitters, IPA, Brown Ales, Mild Ales",
      :notes=>"Malty, balanced flavor.  Fruity, rich finish.  Excellent for cask conditioned ales and bitters."} }
    subject { Brewscribe::Yeast.new data }

    it 'should set the hash to object properties' do
      subject.name.should == data[:name]
    end

    it { subject.lab.should be_a String } 
    it { subject.product_id.should be_a Fixnum } 
    it { Brewscribe::Yeast::FLOCCULATION_TYPES.should include subject.flocculation } 
    it { Brewscribe::Yeast::TYPES.should include subject.type } 
    it { Brewscribe::Yeast::FORMS.should include subject.form } 
    it { subject.starter_size.should be_a Float }
    it { subject.amount.should be_a Float }
    it { subject.price.should be_a Float }
    it { [TrueClass, FalseClass].should include subject.in_recipe.class }
    it { subject.brew_date.should be_a Date }
    it { subject.pkg_date.should be_a Date }
    it { subject.cells.should be_a Float }
    it { subject.min_attenuation.should be_a Float }
    it { subject.max_attenuation.should be_a Float }
    it { subject.min_temp.should be_a Float }
    it { subject.max_temp.should be_a Float }
    it { [TrueClass, FalseClass].should include subject.use_starter.class }
    it { [TrueClass, FalseClass].should include subject.add_to_secondary.class }
    it { subject.times_cultured.should be_a Fixnum }
    it { subject.max_reuse.should be_a Fixnum }
    it { subject.culture_date.should be_a Date }
    it { subject.best_for.should be_a String }
    it { subject.notes.should be_a String }
    it { subject.last_modified.should be_a Date }
  end
end

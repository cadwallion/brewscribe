require 'spec_helper'

describe Brewscribe::Hops do
  describe '#initialize' do
    let(:data) {
      { :last_modified=>"2012-03-14", :name=>"Magnum", 
        :origin=>"Germany", :type=>"0", :form=>"0",
        :alpha=>"14.0000000", :beta=>"6.5000000",
        :percent=>"60.0004174", :inventory=>"0.0000000", 
        :amount=>"3.4900000", :hsi=>"15.0000000", 
        :boil_time=>"60.0000000", :dry_hop_time=>"0.0000000", 
        :notes=>"German Hallertauer hybrid, widely used in Germany\n            Used for: German ales and lagers\n            Aroma: Good aroma and stable spicy flavor\n            Substitutes: N/A", 
        :ibu_contrib=>"61.4998582", :order=>"7",
        :use=>"0", :in_recipe=>"1", :price=>"1.0000000"}
    }

    subject { Brewscribe::Hops.new(data) }

    it 'will set the hash to object properties' do
      subject.name.should == data[:name]
    end

    it { subject.alpha.should be_a Float }
    it { subject.beta.should be_a Float }
    it { subject.boil_time.should be_a Fixnum }
    it { subject.percent.should be_a Float }
    it { subject.percent.should be_a Float }
    it { subject.origin.should be_a String }
    it { subject.notes.should be_a String }
    it { subject.amount.should be_a Float }
    it { subject.hsi.should be_a Float }
    it { subject.dry_hop_time.should be_a Fixnum }
    it { subject.ibu_contrib.should be_a Float }
    it { subject.price.should be_a Float }

    it 'should set in_recipe to a boolean' do
      [TrueClass, FalseClass].should include subject.in_recipe.class
    end

    it 'should set the use property its corresponding USES' do
      Brewscribe::Hops::USES.should include subject.use
    end

    it 'should set the type to its corresponding TYPES' do
      Brewscribe::Hops::TYPES.should include subject.type
    end

    it 'should set the form to its corresponding FORMS' do
      Brewscribe::Hops::FORMS.should include subject.form
    end
  end
end

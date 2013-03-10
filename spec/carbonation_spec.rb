require 'spec_helper'

describe Brewscribe::Carbonation do
  let(:document) { import_document }
  let(:recipe) { document.recipes.first }
  let(:carbonation) { recipe.carbonation }
  subject { carbonation }

  describe '#from_data' do
    it { should be_a Brewscribe::Carbonation }

    its(:carb_rate) { should be_a Float }
    its(:temperature) { should be_a Float }
    its(:last_modified) { should be_a Date }
    its(:type) { should be_one_of Brewscribe::Carbonation::TYPES }
  end
end

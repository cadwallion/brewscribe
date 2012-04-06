require 'spec_helper'

describe Brewscribe do
  let(:recipe_file) { File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r') }

  describe '#import' do
    before do
      Brewscribe::Recipe.any_instance.stub(:parse_raw_data)
    end

    it 'should return a Document object' do
      recipe = Brewscribe.import(recipe_file)
      recipe.should be_a(Brewscribe::Document)
    end
  end
end

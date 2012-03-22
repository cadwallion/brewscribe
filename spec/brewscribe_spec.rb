require 'spec_helper'

describe Brewscribe do
  let(:recipe_file) { File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r') }

  describe '#import' do
    before do
      Brewscribe::Recipe.any_instance.stub(:parse_raw_data)
    end

    it 'should call #read on the passed IO object' do
      file = double()
      file.should_receive(:read)
      Brewscribe.import(file)
    end

    it 'should return a Recipe object' do
      file = double()
      file.stub(:read)
      recipe = Brewscribe.import(file)
      recipe.should be_a(Brewscribe::Recipe)
    end
  end
end

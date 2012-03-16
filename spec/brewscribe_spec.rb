require 'spec_helper'

describe Brewscribe do
  describe '#import' do
    before :each do
      Brewscribe::Recipe.any_instance.stub(:parse_raw_data)
      Brewscribe::Recipe.any_instance.stub(:translate_special_characters)
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

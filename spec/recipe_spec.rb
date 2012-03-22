require 'spec_helper'

describe Brewscribe::Recipe do
  let(:recipe_file) { File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r') }
  subject { Brewscribe::Recipe.new(recipe_file.read) }
  describe '#parse_raw_data' do
    it 'should convert the recipe data into properties' do
      subject.brewer.should == 'CadBrew'
    end

    it 'should return a hash for nested recipe attributes' do
      subject.equipment.should be_a Hash
      subject.equipment[:name].should be_a String
    end
  end

  describe '#clean_key' do
    it 'converts an ugly key into something more readable' do
      subject.clean_key("F_Y_BREW_DATE").should == 'brew_date' 
    end

    it 'converts _MOD_ key to last_modified' do
      subject.clean_key('_MOD_').should == 'last_modified'
    end
  end

  describe '#xml_node_to_hash' do
    it 'converts xml to a corresponding hash' do
      xml = Nokogiri::XML('<foo><bar><baz>1</baz></bar><bazaar>2</bazaar></foo>')
      actual = subject.xml_node_to_hash(xml.root)
      expected = { bar: { baz: '1' }, bazaar: '2' }
      actual.should == expected
    end
  end

  describe '#parse_ingredients' do
    it 'should create a Brewscribe::IngredientList object' do
      subject.ingredients = subject.hash[:ingredients]
      subject.parse_ingredients
      subject.ingredients.should be_a Brewscribe::IngredientList
    end
  end
end

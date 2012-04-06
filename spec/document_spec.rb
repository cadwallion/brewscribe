require 'spec_helper'

describe Brewscribe::Document do
  let(:file) { File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r') }
  subject { Brewscribe::Document.new file: file }

  describe '#parse' do
    it 'should add a Recipe to recipes when a Recipe entry is found' do
      subject.recipes.should have(0).recipes
      hash = subject.parse 
      subject.recipes.should have(1).recipe
      subject.recipes[0].should be_a Brewscribe::Recipe
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
end

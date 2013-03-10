$: << '../lib'

require 'brewscribe'
require 'pry'

def import_document
  Brewscribe.import File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r')
end

RSpec::Matchers.define :be_boolean do
  match do |actual|
    [true, false].include? actual
  end
  failure_message_for_should do |actual|
    "expected #{actual} to be true or false"
  end
end

RSpec::Matchers.define :be_one_of do |expected|
  match do |actual|
    expected.include? actual
  end

  failure_message_for_should do |actual|
    "expected #{actual.class.name} to be in #{expected}"
  end
end

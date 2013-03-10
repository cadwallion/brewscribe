$: << '../lib'

require 'brewscribe'
require './spec/support/recipe_hash'
require 'pry'

def import_document
  Brewscribe.import File.open(File.dirname(__FILE__) + '/support/recipe.bsmx', 'r')
end

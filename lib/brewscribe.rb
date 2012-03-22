require "brewscribe/version"
require 'brewscribe/recipe'
require 'brewscribe/ingredient_list'

module Brewscribe
  def self.import file
    data = file.read 
    Recipe.new(data)  
  end
end

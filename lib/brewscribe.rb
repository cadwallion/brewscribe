require "brewscribe/version"
require 'brewscribe/recipe'

module Brewscribe
  def self.import file
    data = file.read 
    Recipe.new(data)  
  end
end

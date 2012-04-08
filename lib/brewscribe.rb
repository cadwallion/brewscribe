require 'brewscribe/version'
require 'brewscribe/conversion'
require 'brewscribe/document'
require 'brewscribe/recipe'
require 'brewscribe/ingredient_list'
require 'brewscribe/mash'
require 'brewscribe/equipment'

module Brewscribe
  def self.import file
    data = file.read 
    Document.new(data: data)  
  end
end

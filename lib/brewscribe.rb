require 'brewscribe/version'
require 'brewscribe/document'
require 'brewscribe/recipe'
require 'brewscribe/ingredient_list'
require 'brewscribe/conversion'

module Brewscribe
  def self.import file
    data = file.read 
    Document.new(data: data)  
  end
end

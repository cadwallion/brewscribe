require 'brewscribe/grain'

module Brewscribe
  class IngredientList
    attr_reader :grains, :hops, :yeast
    def self.from_data data
      list = new
      if data[:grain]
        data[:grain].each do |grain|
          list.add_grain grain
        end
      end
      list
    end

    def initialize
      @grains = []
      @hops   = []
      @yeast  = []
    end

    def add_grain grain_data
      @grains << Grain.new(grain_data)
    end
  end
end

require 'brewscribe/grain'
require 'brewscribe/hops'

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

      if data[:hops]
        data[:hops].each do |hops|
          list.add_hops hops
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

    def add_hops hop_data
      @hops << Hops.new(hop_data)
    end
  end
end

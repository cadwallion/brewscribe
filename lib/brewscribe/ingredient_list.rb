require 'brewscribe/grain'
require 'brewscribe/hops'
require 'brewscribe/yeast'

module Brewscribe
  class IngredientList
    attr_reader :grains, :hops, :yeasts
    def self.from_data data
      list = new

      case data[:grain]
      when Array
        data[:grain].each do |grain|
          list.add_grain grain
        end
      when Hash
        list.add_grain data[:grain]
      end

      case data[:hops]
      when Array
        data[:hops].each do |hops|
          list.add_hops hops
        end
      when Hash
        list.add_hops data[:hops]
      end

      case data[:yeast]
      when Array
        data[:yeast].each do |yeast|
          list.add_yeast yeast
        end
      when Hash
        list.add_yeast data[:yeast]
      end
      list
    end

    def initialize
      @grains = []
      @hops   = []
      @yeasts  = []
    end

    def add_grain grain_data
      @grains << Grain.new(grain_data)
    end

    def add_hops hop_data
      @hops << Hops.new(hop_data)
    end

    def add_yeast yeast_data
      @yeasts << Yeast.new(yeast_data) 
    end
  end
end

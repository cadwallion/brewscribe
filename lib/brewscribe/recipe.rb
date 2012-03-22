require 'nokogiri'

module Brewscribe
  class Recipe
    attr_reader :raw_data, :hash

    def initialize raw_data
      @raw_data = raw_data

      parse_raw_data  
      create_recipe_accessors
    end

    def parse_raw_data
      @xml = Nokogiri::XML(@raw_data).xpath('/Selections/Data/Recipe') 
      @hash = xml_node_to_hash(@xml.first)
    end

    def create_recipe_accessors
       @hash.keys.each do |key|
        self.class.module_eval do
          attr_accessor key
        end

        self.send "#{key}=", @hash[key]
      end     
    end

    def clean_key key
      extracted = key.to_s.match(/(F_(\w{1,2}_)?)?(_MOD_|.+)/)[3]
      if extracted == '_MOD_' 
        return 'last_modified'
      else
        extracted.downcase
      end
    end

    def parse_ingredients
      self.ingredients = IngredientList.from_data(self.ingredients[:data])
    end

    def xml_node_to_hash node
      if node.element?
        if node.children.size > 0
          result_hash = {} 

          node.children.each do |child|
            result = xml_node_to_hash child
            property = clean_key child.name
            key = property.to_sym

            if child.name == 'text'
              return result if !child.next && !child.previous
            elsif result_hash[key]
              if result_hash[key].is_a? Array
                result_hash[key] << result
              else
                result_hash[key] = [result_hash[key]] << result
              end
            else
              result_hash[key] = result
            end
          end

          return result_hash
        else
          return nil
        end
      else
        return node.content.to_s
      end
    end
  end
end

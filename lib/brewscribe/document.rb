module Brewscribe
  class Document
    attr_reader :raw_data, :hash
    attr_accessor :recipes, :styles

    def initialize options = {}
      @recipes = []
      @styles = []

      if options[:file]
        @raw_data = File.read options[:file]
      elsif options[:data]
        @raw_data = options[:data] 
      end

      parse_data
    end

    def parse_data
      @xml = Nokogiri::XML(@raw_data).xpath('/Selections/Data') 
      @hash = xml_node_to_hash @xml.first

      if @hash[:recipe].class == Hash
        parse_recipes [@hash[:recipe]]
      else
        parse_recipes Array @hash[:recipe]
      end

      if @hash[:style].class == Hash
        parse_styles[@hash[:style]]
      else
        parse_styles Array @hash[:style]
      end

      self
    end

    def parse_recipes recipes
      recipes.each do |recipe_hash|
        @recipes << Recipe.new(recipe_hash)
      end
    end

    def parse_styles styles
      styles.each do |style_hash|
        @styles << Style.from_data(style_hash)
      end
    end

    def xml_node_to_hash node
      if node
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

    def clean_key key
      extracted = key.to_s.match(/(F_(\w{1,2}_)?)?(_MOD_|.+)/)[3]
      if extracted == '_MOD_' 
        return 'last_modified'
      else
        extracted.downcase
      end
    end
  end
end

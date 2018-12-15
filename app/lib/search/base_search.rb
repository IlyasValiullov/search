require "#{File.dirname(__FILE__)}/mode/common_search"
require "#{File.dirname(__FILE__)}/mode/exact_phrase_search"
require "#{File.dirname(__FILE__)}/mode/word_search"

module Search
  class BaseSearch
    attr_reader :query, :results, :source_items, :ranks

    def self.factory(query, source_items)
      search_type = if /^".*"$/.match?(query)
                      Mode::ExactPhraseSearch
                    elsif query.split(' ').length > 0
                      Mode::WordSearch
                    else
                      Mode::CommonSearch
                    end
      new(query, source_items).extend(search_type)
    end

    def initialize(query, source_items)
      @query = query_prepare(query)
      @results = []
      @source_items = source_items
      @ranks = {}
    end

    def execute
      source_items.each_with_index do |item, index|

        prepared_item = source_prepare(item)
        rank = match_rank(prepared_item)
        if rank
          ranks[rank] ? ranks[rank].push(index) : ranks[rank] = [index]
        end

      end
      results = prepare_results
    end

    def prepare_results
      ranks.keys
          .sort {|x, y| y <=> x}
          .map {|key| ranks[key].map {|item_idx| source_items[item_idx]}}
          .flatten
    end

    def source_prepare(item)
      item.values.join(" | ").downcase
    end

    def query_prepare(query)
      @query = query.downcase
    end


    def match_rank
      raise NotImplementedError
    end

  end
end

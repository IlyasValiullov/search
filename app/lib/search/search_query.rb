require "#{File.dirname(__FILE__)}/base_search"

module Search
  class SearchQuery

    attr_reader :search

    def initialize(query, source)
      @search = BaseSearch.factory(query, source)
    end


    def execute
      search.execute
    end


  end
end

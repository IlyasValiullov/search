module Search
  module Mode
    module ExactPhraseSearch

      def match_rank(item)
        rank = 0

        rank += item.include?(query[1..-2]) ? 1 : 0

        rank if rank > 0
      end
    end

    def source_prepare(item)
      item.values.join(" | ")
    end

    def query_prepare(query)
      @query = query
    end
  end
end

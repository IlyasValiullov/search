module Search
  module Mode
    module CommonSearch

      def match_rank(item)
        rank = 0

        rank += item.include?(query) ? 1 : 0

        rank if rank > 0
      end
    end
  end
end

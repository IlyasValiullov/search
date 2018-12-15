module Search
  module Mode
    module WordSearch

      def match_rank(item)

        rank = 0

        rank += item.include?(query) ? 1 : 0

        words_match = 0
        words = query.split(" ")
        words.each do |w|
          words_match += item.include?(w) ? 1 : 0
        end
        rank += 1 if words_match == words.length

        rank if rank > 0
      end

    end
  end
end

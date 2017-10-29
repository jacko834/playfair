class PlayfairKey

  ALPHABET_MINUSJ = [
      "A", "B", "C", "D", "E",
      "F", "G", "H", "I", "K",
      "L", "M", "N", "O", "P",
      "Q", "R", "S", "T", "U",
      "V", "W", "X", "Y", "Z"]

      attr_reader :keyTable

      def initialize(key)
        key.gsub!(/[jJ]/, 'I')
        arrKey = key.scan(/./).uniq
        table = arrKey + (ALPHABET_MINUSJ - arrKey)
        @keyTable = table.each_slice(5).to_a
      end

end
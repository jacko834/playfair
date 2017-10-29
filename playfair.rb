require_relative('playfair_key')

class Playfair


   def initialize(keyCode)

      @table = PlayfairKey.new(keyCode).keyTable
      @rows = @table.length
      @columns = @table[0].length
      @table = @table.flatten

   end


   def encode(message)
      validated_message = validate_message(message)
      split_message = split_message(validated_message)

      split_message.map {|pairing| decode_pair(pairing ) }
          .join('')
   end

   # strips out any non alpha characters and replaces J with I
   def validate_message(message)


      validated_message = message.gsub(/[^a-zA-Z]/, '').upcase.gsub('J','I')


   end


   def split_message(message)
      splitArr = []
      i = 0
      while(i < message.length)
         char1 = message[i]
         # char2 is set to either the next character or 'X' if there are no more characters left
         char2 = i + 1 < message.length ? message[i+1] : 'X'
         # if both characters are the same then need to append an 'X' so we've only processed one character
         if (char1 == char2)
            splitArr << char1 + 'X'
            i = i + 1
            # characters are different so can create this pair in new array
         else
            splitArr << char1 + char2
            i = i + 2
         end
      end
      splitArr
   end


   private

   def decode_pair(pair)
      row1, col1 = coordinates(pair[0])
      row2, col2 = coordinates(pair[1])

      # same row - move to the right
      if row1 == row2
         get_ch(row1, col1+1) + get_ch(row2, col2+1)
      # same column - move down
      elsif col1 == col2
         get_ch(row1+1, col1) + get_ch(row2+1, col2)
      # calculate rectangle - move to same row but column of the other paired number
      else
         get_ch(row1, col2) + get_ch(row2, col1)
      end
   end



   def coordinates(ch)
      p = @table.index(ch)
      [p / @columns, p % @columns]
   end

   def get_ch(row, col)
      p = (row % @rows)*@columns + (col % @columns)
      @table[p]
   end


end
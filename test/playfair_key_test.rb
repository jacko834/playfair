require_relative "../playfair_key"
require "minitest/autorun"

class PlayfairKeyTest < MiniTest::Test

  def test_simple

    pf = PlayfairKey.new("ZSTR")

    assert_equal([["Z", "S", "T", "R", "A"],
                        [ "B", "C", "D", "E", "F"],
                        [ "G", "H", "I", "K", "L"],
                        [ "M", "N", "O", "P", "Q"],
                        [  "U", "V", "W", "X" , "Y"] ],pf.keyTable)
  end

  def test_duplicate_letter

    pf = PlayfairKey.new("ZZSTR")

    assert_equal([["Z", "S", "T", "R", "A"],
                  [ "B", "C", "D", "E", "F"],
                  [ "G", "H", "I", "K", "L"],
                  [ "M", "N", "O", "P", "Q"],
                  [  "U", "V", "W", "X" , "Y"] ],pf.keyTable)
  end

  def test_inclusion_ofj

    pf = PlayfairKey.new("ZJTR")

    assert_equal([["Z", "I", "T", "R", "A"],
                  [ "B", "C", "D", "E", "F"],
                  [ "G", "H", "K", "L", "M"],
                  [ "N", "O", "P", "Q", "S"],
                  [  "U", "V", "W", "X" , "Y"] ],pf.keyTable)
  end



end
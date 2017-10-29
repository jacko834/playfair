require_relative "../playfair"
require "minitest/autorun"

class PlayfairTest < MiniTest::Test

  def test_validate_message_capitalise

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("HIDETHEGOLDINTHETREESTUMP", pf.validate_message("Hide the gold in the tree stump"))
  end

  def test_validate_message_remove_special_characters

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("HIDETHEGOLDINTHETREESTUMP", pf.validate_message("Hide the gold!! in the tree stump@"))
  end

  def test_validate_message_replacej

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("IACKSON", pf.validate_message("JACKSON"))

  end

  def test_split_message_simple

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal(["HI", "DE", "TH", "EG", "OL", "DI", "NX"] , pf.split_message("HIDETHEGOLDIN"))

  end

  def test_split_message_duplicate

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal(["HI", "DE", "TH", "EG", "OL", "DI", "NT", "HE", "TR", "EX", "ES", "TU", "MP"] , pf.split_message("HIDETHEGOLDINTHETREESTUMP"))

  end

  def test_split_message_appendx_toend

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal(["HI", "DE", "TH", "EG", "OL", "DI", "NT", "HE", "TR", "EX", "ES", "TU", "MX"] , pf.split_message("HIDETHEGOLDINTHETREESTUM"))

  end

  def test_encode_example

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("BMODZBXDNABEKUDMUIXMMOUVIF", pf.encode("Hide the gold in the tree stump"))
  end


  def test_encode_same_row_wrap_left

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("HB", pf.encode("GH"))
  end

  def test_encode_same_row_wrap_top

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("TP", pf.encode("KT"))
  end

  # rectangle is within the wider table
  def test_encode_rectangle_inner

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("LX", pf.encode("YR"))
  end

  # rectangle is the full length of the table
  def test_encode_rectangle_outer_length

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("LV", pf.encode("AU"))
  end

  # rectangle is the full width of the table
  def test_encode_rectangle_outer_width

    key = "PLAYFAIREXAMPLE"
    pf = Playfair.new(key)

    assert_equal("FI", pf.encode("PM"))
  end



end
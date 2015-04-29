require_relative 'helper'
require_relative '../lib/day'

class TestDay < Minitest::Test

  def test_start_day_for_jan_2000
    d = Day.new(01, 2000)
    assert_equal 0, d.start_day
  end

  def test_start_day_for_march_2009
    d = Day.new(03, 2009)
    assert_equal 1, d.start_day
  end

  def test_start_day_for_dec_2005
    d = Day.new(12, 2005)
    assert_equal 5, d.start_day
  end

  def test_start_day_for_may_2008
    d = Day.new(05, 2008)
    assert_equal 5, d.start_day
  end

  def test_start_day_for_feb_1900
    d = Day.new(02, 1900)
    assert_equal 5, d.start_day
  end

  def test_start_day_for_feb_1800
    d = Day.new(02, 1800)
    assert_equal 0, d.start_day
  end

end

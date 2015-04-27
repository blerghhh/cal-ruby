require_relative 'helper'
require_relative '../lib/year'

class TestYear < Minitest::Test

  def test_initalizing_a_year_saves_value
    y = Year.new(2015)
    assert_equal 2015, y.year
  end

  def test_leap_non_leap_year
    y = Year.new(2003)
    assert_equal 28, y.leap?
  end

  def test_leap_century_leap_year
    y = Year.new(1900)
    assert_equal 28, y.leap?
  end

  def test_leap_normal_leap_year
    y = Year.new(2004)
    assert_equal 29, y.leap?
  end

  def test_leap_400_year_leap_year
    y = Year.new(2000)
    assert_equal 29, y.leap?
  end

end

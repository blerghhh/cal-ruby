require_relative 'helper'
require_relative '../lib/month'

class TestMonth < Minitest::Test

  def test_initalizing_a_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year.year
  end

  def test_to_s_on_jan_2012
    m = Month.new(01, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_august_2009
    m = Month.new("08".to_i, 2009)
    expected = <<EOS
    August 2009
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_december_2006
    m = Month.new(12, 2006)
    expected = <<EOS
   December 2006
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS
    assert_equal expected, m.to_s
  end

  def test_name_for_march
    m = Month.new(03, 2009)
    assert_equal "March", m.name
  end

  def test_name_for_january
    m = Month.new(01, 2009)
    assert_equal "January", m.name
  end

  def test_name_for_december
    m = Month.new(12, 2009)
    assert_equal "December", m.name
  end

  def test_days_in_december
    m = Month.new(12, 2009)
    assert_equal 31, m.days_in_month
  end

  def test_days_in_september
    m = Month.new("09".to_i, 2009)
    assert_equal 30, m.days_in_month
  end

  def test_start_day_for_jan_2000
    m = Month.new(01, 2000)
    assert_equal 0, m.start_day
  end

  def test_start_day_for_march_2009
    m = Month.new(03, 2009)
    assert_equal 1, m.start_day
  end

  def test_start_day_for_dec_2005
    m = Month.new(12, 2005)
    assert_equal 5, m.start_day
  end

  def test_start_day_for_may_2008
    m = Month.new(05, 2008)
    assert_equal 5, m.start_day
  end

  def test_start_day_for_feb_1900
    m = Month.new(02, 1900)
    assert_equal 5, m.start_day
  end

  def test_start_day_for_feb_1800
    m = Month.new(02, 1800)
    assert_equal 0, m.start_day
  end

end

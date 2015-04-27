require_relative 'helper'

class TestCalIntegration < MiniTest::Test

  ##### Test base case for 31-day month that starts on Sunday #####

  def test_month_starts_on_sunday
  output = `./cal.rb 01 2012`
  expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

  assert_equal expected, output
  end

  def test_single_digit_month_argument
  output = `./cal.rb 1 2012`
  expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

  assert_equal expected, output
  end

  ##### Test normal months #####

  def test_month_january
  output = `./cal.rb 01 2014`
  expected = <<EOS
    January 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_month_february
  output = `./cal.rb 02 2014`
  expected = <<EOS
   February 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS

  assert_equal expected, output
  end

  def test_month_march
  output = `./cal.rb 03 2014`
  expected = <<EOS
     March 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

EOS

  assert_equal expected, output
  end

  def test_month_april
  output = `./cal.rb 04 2014`
  expected = <<EOS
     April 2014
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS

  assert_equal expected, output
  end

  def test_month_may
  output = `./cal.rb 05 2014`
  expected = <<EOS
      May 2014
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_month_june
  output = `./cal.rb 06 2014`
  expected = <<EOS
     June 2014
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS

  assert_equal expected, output
  end

  def test_month_july
  output = `./cal.rb 07 2014`
  expected = <<EOS
     July 2014
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_month_august
  output = `./cal.rb 08 2014`
  expected = <<EOS
    August 2014
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS

  assert_equal expected, output
  end

  def test_month_september
  output = `./cal.rb 09 2014`
  expected = <<EOS
   September 2014
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30

EOS

  assert_equal expected, output
  end

  def test_month_october
  output = `./cal.rb 10 2014`
  expected = <<EOS
    October 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_month_november
  output = `./cal.rb 11 2014`
  expected = <<EOS
   November 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30

EOS

  assert_equal expected, output
  end

  def test_month_december
  output = `./cal.rb 12 2014`
  expected = <<EOS
   December 2014
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS

  assert_equal expected, output
  end


  ##### Test leap years #####


  def test_common_leap_year
  output = `./cal.rb 02 2012`
  expected = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS

  assert_equal expected, output
  end

  def test_century_leap_year
  output = `./cal.rb 02 1900`
  expected = <<EOS
   February 1900
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28

EOS

  assert_equal expected, output
  end

  def test_400_year_leap_year
  output = `./cal.rb 02 2000`
  expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS

  assert_equal expected, output
  end


  ###### Test for incorrect formatting #####

  def test_missing_both_arguments
  output = `./cal.rb`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end

  def test_too_many_arguments
  output = `./cal.rb 01 12 2014`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end


  ##### Test for bad date ranges #####

  def test_min_month
  output = `./cal.rb 0 2014`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end

  def test_max_month
  output = `./cal.rb 13 2014`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end

  def test_min_year
  output = `./cal.rb 01 1799`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end

  def test_max_year
  output = `./cal.rb 01 3001`
  expected = <<EOS
Date not in acceptable format/range.
./cal.rb [month] [year]
EOS

  assert_equal expected, output
  end

end

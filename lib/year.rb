class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap?
    if (@year % 4 == 0)
      if (@year % 100 == 0) and (@year % 400 != 0)
        return 28
      else
        return 29
      end
    else
      return 28
    end
  end

  def to_s
    @year
  end

end

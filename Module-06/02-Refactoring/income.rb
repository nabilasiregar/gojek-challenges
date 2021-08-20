class DateRange 
  attr_reader :start_date, :end_date
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def get_num_of_days
    (date_range.end_date, date_range.start_date).to_i
  end
end

def average_income_in(date_range)
  ## Truncated code
  total_days = date_range.get_num_of_days
  total_income/total_days
end


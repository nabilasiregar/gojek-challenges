class Report
  attr_reader :income, :expense, :tax, :date

  def initialize(income, expense, type, date)
    @income = income
    @expense = expense
    @tax = Tax.new(type)
    @date = date
  end
end

## before refactoring
income_tax = report.tax.income_tax(gross_income)

## after refactoring
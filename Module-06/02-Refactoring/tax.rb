## Before refactoring
class Tax 
  ### Truncated code
  def income_tax(gross_income)
    case @type
    when 'INDIVIDUAL'
      gross_income * 0.1
    when 'ENTERPRISE'
      gross_income * 0.2
    when 'GOVERNMENT'
      gross_income * 0.05
    else gross_income * 0.3
    end
  end
  #Other method with related switch statement
end

## After refactoring
class Tax 
  def income_tax(gross_income)
    gross_income.income_tax
  end
end

class General < Tax
  def income_tax(gross_income)
    gross_income * 0.3
  end
end

class Individual < Tax
  def income_tax(gross_income)
   gross_income * 0.1
  end
end

class Enterprise < Tax
  def income_tax(gross_income)
    gross_income * 0.2
  end
end

class Government < Tax
  def income_tax(gross_income)
    gross_income * 0.05
  end
end


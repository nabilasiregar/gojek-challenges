def gross_income(report)
  gross_income = report.income - report.expense
  return gross_income
end

def net_income(report, gross_income)
  net_income = report.tax.income_tax(gross_income)
  return net_income
end

def get_total_net_income(total_net_income, net_income)
  total_net_income = total_net_income + net_income
  return total_net_income
end
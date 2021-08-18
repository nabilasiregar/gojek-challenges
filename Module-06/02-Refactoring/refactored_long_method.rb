def get_net_income(report)
  gross_income = report.income - report.expense
  net_income = report.tax.income_tax(gross_income)
end

def get_total_net_income(reports)
  reports.sum{ |report| get_net_income(report)}
end
class PayLevel 
  def self.compute_pay(working_level)
    case working_level
    when "1"
      return 3000000 - (3000000 * tax)
    when "2"
      return 4000000 - (4000000 * tax)
    when "3"
      return 5000000 - (5000000 * tax)
    else "unknown level"
    end
  end
end


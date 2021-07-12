require_relative 'character'

class Villain < Character
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @flee_percentage = 0.5
    @fled = false
  end

  def decrease_hitpoint(attack_damage)
    super(attack_damage)
    if alive? && @hitpoint <= 50
      flee if rand < @flee_percentage
    end
  end

  def flee
    @fled = true
    puts Paint[" · #{@name} has fled the battlefield with #{@hitpoint} hitpoint left", :yellow, :bright]
  end

  def flee?
    @fled
  end

  def removed?
    dead? || flee?
  end
end
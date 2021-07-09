require_relative 'character'

class Villain < Character
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @flee_percentage = 0.5
    @fled = false
  end

  def decrease_hitpoint(attack_damage)
    @hitpoint -= attack_damage
    if @hitpoint <= 50
      flee if rand < @flee_percentage
    end
  end

  def flee
    @fled = true
    puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
  end

  def flee?
    @fled
  end
end
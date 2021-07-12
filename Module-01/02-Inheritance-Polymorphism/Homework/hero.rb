require_relative 'character'

class Hero < Character
  attr_reader :healing_point
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @deflect_percentage = 0.8
    @healing_point = 50
  end

  def decrease_hitpoint(attack_damage)
    if rand < @deflect_percentage
      puts Paint[" · #{@name} deflects the attack.", :yellow, :bright]
    else
      super(attack_damage)
    end
  end

  def heal(ally)
    ally.get_healed(@healing_point)
    puts Paint["#{ally} get healed by #{name}. #{healing_point} hitpoint restored.", :green, :bright]
  end
end

    
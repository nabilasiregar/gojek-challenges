require_relative 'character'

class Hero < Character
  attr_reader :healing_point
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @healing_point = 20
  end

  def decrease_hitpoint(attack_damage)
    if deflected? == true && @name === "Jin Sakai"
      puts "#{@name} deflects the attack."
    else
      super(attack_damage)
    end
  end
  
  def heal(ally)
    ally.get_healed(@healing_point)
    puts "#{@name} heals #{ally.name}, restoring #{@healing_point} hitpoints"
  end

  def get_healed(healing_point)
    @hitpoint += healing_point
  end
end
    
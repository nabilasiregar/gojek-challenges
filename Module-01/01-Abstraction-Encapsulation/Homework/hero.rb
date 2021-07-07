require_relative 'character'

class Hero < Character
  def decrease_hitpoint(attack_damage)
    if deflected? == true
      puts "#{@name} deflects the attack."
    else
      super(attack_damage)
    end
  end
end
    
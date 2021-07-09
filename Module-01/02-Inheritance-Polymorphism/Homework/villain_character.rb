require_relative 'villain'

class MongolArcher < Villain
  def attack(other_character)
    puts "#{@name} shoots an arrow at #{other_character.name} with #{@attack_damage} damage"
    other_character.decrease_hitpoint(@attack_damage)
  end
end

class MongolSpearman < Villain
  def attack(other_character)
    puts "#{@name} thrusts #{other_character.name} with #{@attack_damage} damage"
    other_character.decrease_hitpoint(@attack_damage)
  end
end

class MongolSwordsman < Villain
  def attack(other_character)
    puts "#{@name} slashes #{other_character.name} with #{@attack_damage} damage"
    other_character.decrease_hitpoint(@attack_damage)
  end
end
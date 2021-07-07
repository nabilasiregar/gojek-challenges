class Person
  attr_reader :name, :hitpoint, :attack_damage

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
  end

  def to_s
    "#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack damage" 
  end

  def attack(enemy)
    enemy.decrease_hitpoint(@attack_damage)
    puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
  end
  
  def decrease_hitpoint(damage)
    @hitpoint -= damage
  end
end

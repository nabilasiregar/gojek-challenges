class Character 
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
  
  def decrease_hitpoint(attack_damage)
    @hitpoint -= attack_damage
  end

  def is_dead?
    if @hitpoint <= 0
      puts "#{@name} dies"
      true
    end
  end

  def deflected?
    deflection = [true, false].sample
  end     
end
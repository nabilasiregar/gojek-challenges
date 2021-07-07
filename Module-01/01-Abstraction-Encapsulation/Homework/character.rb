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
    puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
    enemy.decrease_hitpoint(@attack_damage)
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
    rand(100) <= 80
  end     
end
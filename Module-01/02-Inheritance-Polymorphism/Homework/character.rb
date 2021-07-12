class Character 
  attr_reader :name, :hitpoint, :attack_damage

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
    @alive = true
  end

  def to_s
    "#{@name}" 
  end

  def print_stats
    puts "#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack damage" 
  end

  def attack(enemy)
    puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
    enemy.decrease_hitpoint(@attack_damage)
  end
  
  def decrease_hitpoint(attack_damage)
    @hitpoint -= attack_damage
    if @hitpoint <= 0
      puts "#{@name} dies"
      die
    end
  end

  def get_healed(healing_point)
    @hitpoint += healing_point
  end

  def die
    puts "#{@name} dies"
    @alive = false
  end

  def is_dead?
    !@alive
  end

  def removed?
    is_dead?
  end    
end
class Character 
  attr_reader :name, :hitpoint, :attack_damage, :alive

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
  end

  def to_s
    "#{@name}" 
  end

  def print_stats
    puts Paint["#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack damage", :green]
  end

  def attack(target, action = "attacks")
    puts Paint["#{@name} #{action} #{target.name} with #{@attack_damage} damage", :yellow]
    target.decrease_hitpoint(@attack_damage)
  end
  
  def decrease_hitpoint(attack_damage)
    @hitpoint -= attack_damage
    puts Paint[" · #{@name} dies", :yellow, :bright] if @hitpoint <= 0
  end

  def get_healed(healing_point)
    @hitpoint += healing_point
  end

  def alive?
    @hitpoint > 0
  end


  def dead?
    @hitpoint <= 0
  end

  def removed?
    dead?
  end
end
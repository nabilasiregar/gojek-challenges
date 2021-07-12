require_relative 'hero'

class PlayableCharacter < Hero
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @actions = ["attack", "heal"]
  end

  def play_turn(heroes, villains)
    action = ask_user_for_action
    if action == "heal"
      target = ask_user_for_target(action, heroes)
      heal(target)
    elsif action == "attack"
      target = ask_user_for_target(action, villains)
      attack(target)
      villains.delete(target) if (target.is_dead? || target.flee?) 
    end
  end

  def ask_user_for_action
    puts "Which action do you want to do?"
    puts "1) Attack an enemy"
    puts "2) Heal an ally"
    
    selected_action = gets.chomp.to_i - 1
    puts "\n"

    @actions[selected_action]
  end

  def ask_user_for_target(action, targets)
    puts "Which character do you want to #{action}"
    targets.each_with_index do |target, index| 
      puts "#{index + 1}) #{target}"
    end
    selected_target_index = gets.chomp.to_i - 1
    puts "\n"

    selected_target = targets[selected_target_index]
  end
end
class ActionsView
  def ask_user_for_action
    puts "As Jin Sakai, what do you want to do?"
    puts "1) Attack an enemy"
    puts "2) Heal an ally"
    return gets.chomp.to_i
  end

  def ask_user_for_a_villain(hero, villains)
    villains = ["Mongol Archer", "Mongol Spearman", "Mongol Swordsman"]
    puts "Which enemy do you want to attack?"
    i = 1
    villains.each do |villain|
      puts "#{i}) #{villain}"
      i += 1
    end
  end

  def ask_user_for_an_ally(savior, heroes)
    allies = []
    heroes.each { |hero| allies.push(hero) if hero != savior}
    return "you don't have an ally" if allies.empty?
  
    puts "Which ally do you want to heal?"
    i = 1
    allies.each do |ally|
      puts "#{i}) #{ally.name}"
      i += 1
    end
  end
end
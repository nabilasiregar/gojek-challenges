class ActionsView
  def ask_user_for_action
    puts "As Jin Sakai, what do you want to do?"
    puts "1) Attack an enemy"
    puts "2) Heal an ally"
    return gets.chomp.to_i
  end
end
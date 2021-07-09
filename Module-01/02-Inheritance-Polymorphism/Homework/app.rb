require_relative 'hero'
require_relative 'villain'
require_relative 'villain_character'
require_relative 'action_view'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin
yuna = Character.new("Yuna", 90, 45)
puts yuna
sensei = Character.new("Sensei Ishikawa", 80, 60)
puts sensei
heroes = [jin, yuna, sensei]
puts "\n"

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
puts mongol_archer
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
puts mongol_spearman
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)
puts mongol_swordsman
villains = [mongol_archer, mongol_spearman, mongol_swordsman]
puts "\n"

@action = ActionsView.new
user_input = @action.ask_user_for_action








# i = 1
# until (jin.is_dead? || villains.empty?) do
#   puts "=========== Turn #{i} ==========="
#   puts "\n"

#   puts jin
#   villains.each do |villain|
#     puts villain
#   end
#   puts "\n"

#   jin.attack(villains[rand(villains.size)])
#   villains.each do |villain|
#     villains.delete(villain) if villain.is_dead? || villain.flee?
#   end
#   puts "\n"

#   villains.each do |villain|
#     villain.attack(jin)
#   end
#   puts "\n"

#   i += 1
# end


require_relative 'hero'

jin = Hero.new("Jin Sakai", 100, 50)
puts jin
puts "\n"

khotun = Hero.new("Khotun Khan", 500, 50)
puts khotun
puts "\n"

until khotun.is_dead? || jin.is_dead? do
  jin.attack(khotun)
  puts khotun
  puts "\n"

  khotun.attack(jin)
  puts jin
  puts "\n"
end


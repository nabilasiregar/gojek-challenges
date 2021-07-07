require_relative 'person'

jin = Person.new("Jin Sakai", 100, 50)
puts jin
puts "\n"

khotun = Person.new("Khotun Khan", 500, 50)
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
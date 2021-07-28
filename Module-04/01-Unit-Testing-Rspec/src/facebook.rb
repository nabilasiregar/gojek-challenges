class WLI
  attr_reader :names
  def initialize(names)
    @names = names
  end

  def likes
    if names.count > 2 
      return "#{names[0..-2].join(', ')}, and #{names.last} like this post"
    elsif names.count === 2
      return "#{names[0]} and #{names[1]} like this post"
    elsif names.count === 1
      return "#{names.first} likes this post"
    else
      puts "You have no likes"
    end
  end
end
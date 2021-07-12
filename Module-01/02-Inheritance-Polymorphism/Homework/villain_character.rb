require_relative 'villain'

class MongolArcher < Villain
  def attack(target)
    super(target, "shoots an arrow at")
  end
end

class MongolSpearman < Villain
  def attack(target)
    super(target, "thrusts")
  end
end

class MongolSwordsman < Villain
  def attack(target)
    super(target, "slashes")
  end
end
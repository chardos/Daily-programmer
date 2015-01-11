class Set

  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  #union
  def | (otherArr)
    return arr | otherArr.arr
  end

  #intersection
  def & (otherArr)
    return arr & otherArr.arr
  end

  #difference
  def - (otherArr)
    return arr - otherArr.arr
  end

  def arr
    return @arr.uniq
  end
end

s1 = Set.new([4,4,1,2,3,3,5]);
s2 = Set.new([3,5,6,7,8]);

puts s1 | s2
puts ' '
puts s1 & s2


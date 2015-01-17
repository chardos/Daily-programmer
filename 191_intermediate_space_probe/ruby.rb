class Map
  #attr_accessor:@arr1

 


  def initialize (n)
    @map = []
    create_map(n)
    print_map
  end

  def create_map(n)
    for y in 0..n-1 do
      @map[y] = []
      for x in 0..n-1 do
        @map[y].push('.')
      end
    end
  end



  def print_map
    @map.each do |y|
      y.each do |x|
        print "#{x}  "
      end
      print "\n\n"
    end
  end



end

map = Map.new(3)


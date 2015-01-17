class Map
  #attr_accessor:@arr1

 


  def initialize (n)
    @map = []
    create_map(n)
    add_obstacles(n)
    print_map

    #puts @map[2][0]
  end

  def create_map(n)
    for y in 0..n-1 do
      @map[y] = []
      for x in 0..n-1 do
        @map[y].push('.')
      end
    end
  end

  def convert_1d_to_2d(pos, rows, spaces)
    y = (pos/(rows*1.0)).ceil - 1
    x = pos%rows

    #reset back to index 0
    if x === 0
      x = rows -1
    else
      x -= 1
    end

    [y,x]

  end

  def add_obstacles(n)
    no_of_spaces = n*n
    no_of_asteroids = no_of_spaces * 0.3
    no_of_gravity_wells = no_of_spaces * 0.1

    #make an array of no_of_spaces
    ref_array = (1..no_of_spaces).to_a

    #get random space + delete the space from ref_array
    random = rand(ref_array.length) + 1
    ref_array_position = ref_array.delete(random)
    array_positions = convert_1d_to_2d(ref_array_position, n, no_of_spaces)

    #create method that converts number to array position
    puts ref_array_position
    puts '------'
    puts ref_array

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


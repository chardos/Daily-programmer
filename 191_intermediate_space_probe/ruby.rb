class Map
  #attr_accessor:@arr1

  def initialize (n)
    @n = n
    @map = []
    @no_of_asteroids = 0.2
    @no_of_gravity_wells = 0.05
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
    puts "pos #{pos}"
    y = (pos/(rows*1.0)).ceil - 1
    x = pos%rows

    #reset back to index 0
    if x === 0
      x = rows -1
    else
      x -= 1
    end

    puts "y #{y}"
    puts "x #{x}"
    puts "--------"

    [y,x]

  end

  def surround_G_with_X(y, x)
    puts "y #{y} x #{x}"
    (-1..1).each do |mod_x|
      (-1..1).each do |mod_y|
        modified_y = y + mod_y
        modified_x = x + mod_x

        puts "mod X #{modified_x}"
        puts "mod Y #{modified_y}"

        if modified_x >= 0 && modified_y >= 0 && modified_x < @n && modified_y < @n
          current_position = @map[modified_y][modified_x]
          if current_position != 'G' && current_position != 'A'
            @map[modified_y][modified_x] = 'X'
          end
        end

      end
    end
  end

  def add_obstacles(n)
    no_of_spaces = n*n
    no_of_asteroids = (no_of_spaces * @no_of_asteroids).floor
    no_of_gravity_wells = (no_of_spaces * @no_of_gravity_wells).floor

    no_of_asteroids = 1 if no_of_asteroids === 0
    no_of_gravity_wells = 1 if no_of_gravity_wells === 0

    #make an array of no_of_spaces
    ref_array = (1..no_of_spaces).to_a

    #add asteroids
    (1..no_of_asteroids).each do 
      random = rand(ref_array.length) 
      ref_array_position = ref_array.delete_at(random)
      puts "ref_array_position #{ref_array_position}"
      array_positions = convert_1d_to_2d(ref_array_position, n, no_of_spaces)
      @map[array_positions[0]][array_positions[1]] = 'A'
    end

    #add gravity wells
    (1..no_of_gravity_wells).each do 
      random = rand(ref_array.length) 
      ref_array_position = ref_array.delete_at(random)
      puts "ref_array_position #{ref_array_position}"
      array_positions = convert_1d_to_2d(ref_array_position, n, no_of_spaces)
      @map[array_positions[0]][array_positions[1]] = 'G'
    end

    #add X around each gravity well
    @map.each_with_index do |y, y_index|
      y.each_with_index do |x, x_index|
        current_position = @map[y_index][x_index]
        if current_position === 'G'

          #iterate all 8 points around it
          surround_G_with_X(y_index, x_index)

        end
      end
    end


  end

  def print_map

    #write functionality to hide X's if true parameter is passed in

    @map.each do |y|
      y.each do |x|
        print "#{x}  "
      end
      print "\n\n"
    end
  end



end

map = Map.new(15)


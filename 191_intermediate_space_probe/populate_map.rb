module Populate_Map


  def add_start_end_points(n)
    @map[ @start_point[0] ][ @start_point[1] ] = 'S'
    @map[ @end_point[0] ][ @end_point[1] ] = 'E'
  end

  def add_obstacles(n)
    no_of_spaces = n*n
    no_of_asteroids = (no_of_spaces * @no_of_asteroids).floor
    no_of_gravity_wells = (no_of_spaces * @no_of_gravity_wells).floor

    no_of_asteroids = 1 if no_of_asteroids === 0
    no_of_gravity_wells = 1 if no_of_gravity_wells === 0

    #make an array of no_of_spaces
    ref_array = (1..no_of_spaces).to_a

    #remove start + end from ref_array
    start_point = convert_2d_to_1d( @start_point )
    ref_array.delete(start_point)
    end_point = convert_2d_to_1d( @end_point )
    ref_array.delete(end_point)

    #add asteroids
    (1..no_of_asteroids).each do 
      random = rand(ref_array.length) 
      ref_array_position = ref_array.delete_at(random)
      #puts "ref_array_position #{ref_array_position}"
      array_positions = convert_1d_to_2d(ref_array_position, n)
      @map[array_positions[0]][array_positions[1]] = 'A'
    end

    #delete the 8 spaces around start and end, so no gravity well spawns adjacent to them
    surrounding_squares(@start_point[0],@start_point[1]).each do |i|
      a = convert_2d_to_1d([i[0],i[1]])
      ref_array.delete(a)
    end
    surrounding_squares(@end_point[0],@end_point[1]).each do |i|
      a = convert_2d_to_1d([i[0],i[1]])
      ref_array.delete(a)
    end

    #add gravity wells
    (1..no_of_gravity_wells).each do 
      random = rand(ref_array.length) 



      ref_array_position = ref_array.delete_at(random)
      #puts "ref_array_position #{ref_array_position}"
      array_positions = convert_1d_to_2d(ref_array_position, n)
      @map[array_positions[0]][array_positions[1]] = 'G'
    end

    #add X around each gravity well
    @map.each_with_index do |y, y_index|
      y.each_with_index do |x, x_index|
        current_position = @map[y_index][x_index]
        if current_position === 'G'

          #iterate all 8 points around it
          surrounding_squares(y_index, x_index).each do |i|
            surrounding_position = @map[i[0]][i[1]]
            if surrounding_position != 'G' && surrounding_position != 'A'
              @map[i[0]][i[1]] = 'X'
            end
          end

        end
      end
    end
  end

end
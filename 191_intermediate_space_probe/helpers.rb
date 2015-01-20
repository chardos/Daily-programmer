module Helpers

  def convert_1d_to_2d(pos, rows)
    #puts "pos #{pos}"
    y = (pos/(rows*1.0)).ceil - 1
    x = pos%rows

    #reset back to index 0
    if x === 0
      x = rows -1
    else
      x -= 1
    end
    #puts "y #{y}"
    #puts "x #{x}"
    #puts "--------"

    [y,x]
  end



  #1d position is index 1
  def convert_2d_to_1d(pos)
    pos[0] * @n + (pos[1] + 1)
  end

  def surrounding_squares(y, x)
    result = []

    (-1..1).each do |mod_x|
      (-1..1).each do |mod_y|
        modified_y = y + mod_y
        modified_x = x + mod_x
        #puts "mod X #{modified_x}"
        #puts "mod Y #{modified_y}"

        if modified_x >= 0 && modified_y >= 0 && modified_x < @n && modified_y < @n
          unless y == modified_y && x == modified_x
            result.push([modified_y, modified_x])
          end
        end

      end
    end
    return result
  end

  def get_heuristic_value(y,x)
    #how fars it from the end
    y_diff = (y - @end_point[0]).abs
    x_diff = (x - @end_point[1]).abs
    return y_diff + x_diff
  end

end


=begin
if current_position != 'G' && current_position != 'A'
  @map[modified_y][modified_x] = 'X'
end
=end

module Find_Path

  def find_path
    current_position = @start_point
    #analyze adjacent blocks
    surrounding_squares(current_position[0], current_position[1]).each do |i|
      print i
      puts ''
    end
    #pick block with lowest F

  end

end



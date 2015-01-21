module Find_Path
  def find_path
    cur_pos = @start_point

    #analyze adjacent blocks
    surrounding_squares(cur_pos[0], cur_pos[1]).each do |adj_pos|

      puts ''
      puts "#{adj_pos}, #{cur_pos}"

      h_score = @h_score_map[adj_pos[0]][adj_pos[1]]
      if is_diagonal? cur_pos, adj_pos
        g_score = 14
      else
        g_score = 10
      end
      f_score = g_score + h_score
      @f_score_map[adj_pos[0]][adj_pos[1]] = f_score


      #if diagonal add 14 - else add 10
    end
    
    #pick block with lowest F

  end
end



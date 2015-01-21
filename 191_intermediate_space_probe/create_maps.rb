module Create_Maps

  def create_map
    for y in 0..@n-1 do
      @map[y] = []
      for x in 0..@n-1 do
        @map[y].push('.')
      end
    end
  end

  def create_h_score_map
    for y in 0..@n-1 do
      @h_score_map[y] = []
      for x in 0..@n-1 do
        heuristic = get_heuristic_value(y,x)
        @h_score_map[y].push(heuristic)
      end
    end
  end

  def create_f_score_map
    for y in 0..@n-1 do
      @f_score_map[y] = []
      for x in 0..@n-1 do
        @f_score_map[y].push('.')
      end
    end
  end

end
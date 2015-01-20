module Create_Maps

  def create_map
    for y in 0..@n-1 do
      @map[y] = []
      for x in 0..@n-1 do
        @map[y].push('.')
      end
    end
  end

  def create_heuristic_map
    for y in 0..@n-1 do
      @heuristic_map[y] = []
      for x in 0..@n-1 do
        heuristic = get_heuristic_value(y,x)
        @heuristic_map[y].push(heuristic)
      end
    end
  end

end
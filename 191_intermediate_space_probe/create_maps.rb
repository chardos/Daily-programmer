module Create_Maps

  def create_map(n)
    for y in 0..n-1 do
      @map[y] = []
      for x in 0..n-1 do
        @map[y].push('.')
      end
    end
  end

  def create_heuristic_map
    
  end

end
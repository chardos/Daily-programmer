require_relative 'create_maps'
require_relative 'populate_map'
require_relative 'helpers'

class Map

  def initialize (n, start_point, end_point)
    @n = n
    @start_point = start_point
    @end_point = end_point
    @map = []
    @no_of_asteroids = 0.2
    @no_of_gravity_wells = 0.05
    create_map(n)
    add_start_end_points(n)
    add_obstacles(n)
    print_map

    #puts @map[2][0]
  end

  include Helpers
  include Create_Maps
  include Populate_Map

  def print_heuristic_map
    
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

map = Map.new( 10, [0,0], [4,4] )


require_relative 'helpers'
require_relative 'create_maps'
require_relative 'populate_map'
require_relative 'find_path'

class Map

  def initialize (n, start_point, end_point)
    @n = n
    @start_point = start_point
    @end_point = end_point
    @map = []
    @h_score_map = []
    @f_score_map = []
    @no_of_asteroids = 0.2
    @no_of_gravity_wells = 0.05
    create_map
    create_h_score_map
    create_f_score_map
    add_start_end_points(n)
    add_obstacles(n)
    print_map
    print_heuristic_map
    find_path

    get_heuristic_value(3,2)

  end

  include Helpers
  include Create_Maps
  include Populate_Map
  include Find_Path

  def print_heuristic_map
    @h_score_map.each do |y|
      y.each do |x|
        print "#{x}  "
      end
      print "\n\n"
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

map = Map.new( 5, [0,0], [4,4] )


GRID_SIZE = 5

# function to check if a position is within the grid
def inside_grid?(x, y)
  x.between?(0, GRID_SIZE - 1) && y.between?(0, GRID_SIZE - 1)
end

# function to convert a position in the form "A1" to coordinates [0, 0]
def position_to_coords(position)
  x = position[0].ord - 'A'.ord
  y = position[1..-1].to_i - 1
  [x, y]
end

# function to convert coordinates [0, 0] to a position in the form "A1"
def coords_to_position(coords)
  x = (coords[0] + 'A'.ord).chr
  y = (coords[1] + 1).to_s
  x + y
end

# function to draw the grid
def draw_grid(ping_position, pong_position)
  puts "   A B C D E"
  puts "   ---------"
  (0...GRID_SIZE).each do |y|
    print "#{y + 1}| "
    (0...GRID_SIZE).each do |x|
      if [x, y] == ping_position
        print "P "
      elsif [x, y] == pong_position
        print "O "
      else
        print ". "
      end
    end
    puts "|#{y + 1}"
  end
  puts "   ---------"
  puts "   A B C D E"
end

# function to move the ping ball
def move_ping_ball(ping_start, ping_moves, pong_position)
  ping_moves.each do |move|
    dx, dy = case move[1]
             when 'L' then [-1, 0]
             when 'R' then [+1, 0]
             when 'U' then [0, -1]
             when 'D' then [0, +1]
             end
    ping_position = [ping_start[0] + dx, ping_start[1] + dy]
    if inside_grid?(*ping_position)
      if ping_position == pong_position
        pong_position = [rand(GRID_SIZE), rand(GRID_SIZE)]
      else
        ping_start = ping_position
      end
    else
      puts "Ping is off the grid"
      return false
    end
    draw_grid(ping_start, pong_position)
  end
  puts "Ping wins!"
  true
end

# main game loop
loop do
  puts "Enter the starting position of the ping ball and its moves, and the position of the pong ball (e.g. A2 2R 2U D4):"
  input = gets.chomp.split
  ping_start = position_to_coords(input[0])
  ping_moves = input[1..-2]
  pong_position = position_to_coords(input[-1])
  draw_grid(ping_start, pong_position)
  if move_ping_ball(ping_start, ping_moves, pong_position)
    break
  end
end

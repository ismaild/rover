class Rover

  def initialize(initial_position)
    initial_position = initial_position.split
    @x = initial_position[0].to_i
    @y = initial_position[1].to_i
    @orientation = initial_position[2]
    @orientation_movement = {
      'S' => -1, 
      'W' => 1,
      'N' => 1,
      'E' => -1
    }
    @orientation_list = @orientation_movement.keys
  end

  attr_accessor :x, :y

  attr_reader :orientation

  def to_s
    [@x, @y, @orientation]
  end

  def position
    [@x, @y]
  end

  def valid_turn(turn)
    ['L','R'].include?(turn)
  end

  def turn(instruction)
      if instruction == 'L'
        @orientation = get_new_orientation(-1)
      else
        @orientation = get_new_orientation(1) || @orientation_list[0]
      end
    end

  def movement_instructions(instruction_list)
    instruction_list.each_char do |instruction|
      move(instruction)
    end
  end

  def move(instruction) 
    if valid_turn(instruction)
      turn(instruction)
    else
      move_by(movement_direction)
    end
  end

  private
    def get_new_orientation(n)
      @orientation_list[@orientation_list.index(@orientation)+n]
    end

    def movement_direction
      @orientation_movement[@orientation]
    end

    def move_by(n)
      if @orientation == 'N' or @orientation == 'S'
        @x += movement_direction
      else
        @y += movement_direction
      end
    end
end
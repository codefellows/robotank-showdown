require 'rrobots'

# Fast and furious
class Destroyer
  include Robot

  def initialize
    @counter = 0
    @locked_on = false
    @last_heading = ''
    @midpoint = 800
    @cutoff = 75
  end

  def tick(events)
    move_to(@midpoint) if energy >= @cutoff
    evasive_maneuvers if energy < @cutoff
    move_forward_and_back if energy < @cutoff
    lock_on
    fire 1 unless events['robot_scanned'].empty?
    # say battlefield_height
  end

  def move_to(point)
    if x < @midpoint
      face(:east)
      accelerate(1)
    elsif x > @midpoint
      face(:west)
      accelerate(1)
    else
      stop
    end
  end

  def evasive_maneuvers
    face :north if @counter < 100
    face :west if @counter < 50
    face :south if @counter < 25
    # elsif energy < 30
    #   face :north if @counter < 100
    #   face :west if @counter < 80
    #   face :south if @counter < 60
    #   face :east if @counter < 40
    #   face :west if @counter < 20

  end

  def face(direction)
    case direction
    when :east
      turn (1) unless heading == 0
    when :north
      turn (1) unless heading == 90
    when :west
      turn (1) unless heading == 180
    when :south
      turn (1) unless heading == 270
    else
      turn(1) unless heading == direction
    end
  end

  def move_forward_and_back
    if @counter < 50
      accelerate 1
      @counter += 1
    elsif @counter < 100
      accelerate -1
      @counter += 1
    else
      @counter = 0
    end
  end

  def lock_on
    unless @locked_on
      turn_gun(30)
    end
    if !events['robot_scanned'].empty?
      @locked_on = true
      @last_heading = events['robot_scanned']
    else
      @locked_on = false
    end
  end
end

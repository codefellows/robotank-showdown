require 'rrobots'

class Psycho
  include Robot

  def initialize
    @at_bottom = false
    @scanner_on = false
    @locked_on = false
    @enemy_found = false
    @enemy_position = 0
  end

  def tick(events)
    unless @at_bottom
      turn_down
      goto_bottom
    end

    if @at_bottom
      stop
      aim 
      fire(1) 
    end
  end

  #rotate to face south
  def turn_down
    difference = (270 - heading).abs
    if difference < 1
      return
    end

    if heading > 90 && heading < 270
      turn_left
    else
      turn_right
    end
  end

  #rotate left to south
  def turn_left
    difference = 270 - heading
    difference < 10 ? turn(difference) : turn(10)
  end


  #rotate right to south
  def turn_right
    difference = heading - 270
    (difference < 10 && difference > 0) ? turn(difference) : turn(-10)
  end

  #if not at bottom, head that way
  def goto_bottom
    if y < battlefield_height - 61
      accelerate 1
    else
      @at_bottom = true
    end
  end

  def aim
    if events['robot_scanned'].first
      @locked_on = true
    end

    turn_gun(2) unless @locked_on
  end
end

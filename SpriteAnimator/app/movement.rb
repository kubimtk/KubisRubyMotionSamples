
class LinearMovement
  def initialize
    speed=10*rand(0)
    @dx=speed*rand(0)
    @dy=speed*rand(0)
  end
  
  def move(x,y,direction_x,direction_y,distance)
    [x+@dx*direction_x,y+@dx*direction_y]
  end
end

class SinusMovement
  N=256
  PI=3.14159265358979
  def initialize
    @dist_2pi=100+2000*rand(0)
    @amplitude=2+5*rand(0)
    @speed=5*rand(0)
  end
  
  def move(x,y,direction_x,direction_y,distance)
    a = distance % @dist_2pi
    angle=N*a/@dist_2pi
    #puts "x=#{x} y=#{y} direction_x=#{direction_x} direction_y=#{direction_y} a=#{a} dist_2pi=#{@dist_2pi} angle=#{angle} COS[angle]=#{COS[angle]}"
    [x + @speed*direction_x,y+@amplitude*COS[angle]*direction_y]
  end
end
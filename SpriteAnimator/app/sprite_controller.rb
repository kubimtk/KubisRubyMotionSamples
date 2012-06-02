class SpriteController
  attr_reader :id, :sprite
  def initialize (id,min_x,min_y,max_x,max_y, sprite)
    @id=id
    @sprite = sprite
    @scale = 0.5+3*rand(0)

    @width=@sprite.width*@scale
    @height=@sprite.height*@scale

    @min_x=min_x
    @min_y=min_y
    @max_x=max_x-@width
    @max_y=max_y-@height
    
    @movements=Array.new
    @direction_x=rand(2)
    @direction_x=-1 if 0==@direction_x 
    @direction_y=rand(2)
    @direction_y=-1 if 0==@direction_y 
    random_hyper_jump
    @change_x=@change_y=false
  end
  
  def random_hyper_jump
    x=@min_x+(@max_x-@min_x)*rand(0)
    y=@min_y+(@max_y-@min_y)*rand(0)
    @sprite.setPos(x,y,@scale)
  end
  
  def add_movement(movement)
    @movements << movement
  end
  
  def step(distance)
    x,y=@sprite.xy
    @direction_x = -@direction_x if @change_x
    @direction_y = -@direction_y if @change_y
    @change_x=@change_y=false
    #puts "@x=#{@x} @y=#{@y} x=#{x} y=#{y} @direction_x=#{@direction_x} @direction_y=#{@direction_y} @last_ok_x=#{@last_ok_x} @last_ok_y=#{@last_ok_y}"
    
    #scale=(distance%100)/30.0
    @movements.each do |m|
      x,y=m.move(x,y,@direction_x,@direction_y, distance)
    end
    
    @sprite.setPos(x,y,@scale)
  end
  
  def check_bounds
    x,y=@sprite.xy
    @change_x = true if (x<=@min_x) or (x>=@max_x)
    @change_y = true if (y<=@min_y) or (y>=@max_y)
  end
  
  def check_collision(other)
    #puts "KKK: CHECK #{id} against #{other.id}"
    @change_x = @change_y = true if @sprite.collides_with?(other.sprite)
  end
end

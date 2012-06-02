class CGRect
  def to_s
    "(#{origin.x},#{origin.y})-(#{origin.x+size.width},#{origin.y+size.height})" 
  end
end

class Sprite < UIView
  attr_reader :width, :height, :scale
  def init(imageName, parentView)
    super()
    @img = UIImage.imageNamed(imageName)

    @pic = UIImageView.alloc.initWithImage(@img)
    self.addSubview(@pic)
    parentView.addSubview self
    @width = @img.size.width
    @height = @img.size.height
    #puts "KKK: @width=#{@width} @height=#{@height} "
    @scale = 1
    self
  end

  def setPos(x,y,faktor)
    @scale = faktor;
    @pic.frame = CGRectMake(x, y, @width*faktor, @height*faktor)
    #puts "KKK: x=#{x} y=#{y} width=#{@width} height=#{@height} scale=#{@scale}"
  end

  def flipXY(x,y)
    xv=1;xv=-1 if x
    yv=1;yv=-1 if y
    @pic.transform = CGAffineTransformMakeScale( xv, yv)
  end

  def position
    return CGPointMake(@pic.frame.origin.x, @pic.frame.origin.y)
  end
  
  def x
    @pic.frame.origin.x
  end

  def y
    @pic.frame.origin.y
  end
  
  def xy
    [@pic.frame.origin.x, @pic.frame.origin.y]
  end

  def frame
    #puts "KKK: fx=#{fx} fy=#{fy} width=#{@width} height=#{@height} scale=#{@scale}"
    return CGRectMake(x, y, @width*@scale, @height*@scale)
  end

  @@i_cnt=0
  
  def collides_with?(other)
    ret=CGRectIntersectsRect(frame, other.frame)
    puts "KKK: #{frame.to_s}.collides_with? #{other.frame.to_s}: #{ret}" if (@@i_cnt+=1)<20
    ret
  end

end
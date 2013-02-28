class ViewController < UIViewController
  attr_accessor :canvas
  @@NUM_SPRITES=10
  def viewDidLoad
    super
    UIApplication.sharedApplication.setStatusBarOrientation(UIDeviceOrientationLandscapeRight, animated:false);
    UIApplication.sharedApplication.setStatusBarHidden(true, withAnimation: UIStatusBarAnimationNone)

    @canvas = UIImageView.alloc.init
    @canvas.frame = UIScreen.mainScreen.applicationFrame
    @canvas.image = UIImage.imageNamed("bg.png")
    @canvas.userInteractionEnabled = true;
    self.view = @canvas;

    @screenWidth = self.view.bounds.size.height; # = iPhone: 480 Pixel
    @screenHeight = self.view.bounds.size.width; # = iPhone: 320 Pixel
    #puts "screenWidth: #{@screenWidth} screenHeight: #{@screenHeight}"

    @collision_check_on=@@NUM_SPRITES <= 10

    @sprites=Array.new
    (1..@@NUM_SPRITES).each do |i|
      sprite=Sprite.alloc.initWithImage("kk.png", @canvas)
      sc=SpriteController.new(i,0,0,@screenWidth, @screenHeight, sprite)
      if @collision_check_on
        collides=true
        while collides do
          collides=false
          @sprites.each do |s|
            collides |= sprite.collides_with? s.sprite
          end
          sc.random_hyper_jump if collides
        end
      end
      r=rand(3)
      sc.add_movement SinusMovement.new if r==1 || r==2
      sc.add_movement LinearMovement.new if r==0 || r==2
      @sprites << sc

    end

    @game_engine_caller = CADisplayLink.displayLinkWithTarget(self, selector:'game_engine')
    @game_engine_caller.setFrameInterval 2
    @game_engine_caller.addToRunLoop(NSRunLoop.currentRunLoop, forMode:NSDefaultRunLoopMode)
    @distance=0.0
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation==UIInterfaceOrientationLandscapeLeft
    #true
  end

  def game_engine
    @sprites.each do |s|
      s.check_bounds
      check_collisions s if @collision_check_on
      s.step @distance
      @distance += 1.0
    end
  end

  def check_collisions s
    @sprites.each do |s2|
      s.check_collision s2 unless s==s2
    end
  end

  def didReceiveMemoryWarning
    super
  end

end
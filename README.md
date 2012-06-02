Kubi's RubyMotionSamples
========================

Welcome to my first repository covering RubyMotion sample projects.

RubyMotion (see www.rubymotion.com) is a toolchain for iOS allowing native programming of iOS devices with ruby (based on MacRuby).

SpriteAnimator
---------------
The first project (SpriteAnimator) uses iOS' CADisplayLink as base concept of a sprite animation application.
You do not need need to know more about the iOS frameworks to create your own animation.
It shows some great ruby language advantages like:

    class CGRect
      def to_s
        "(#{origin.x},#{origin.y})-(#{origin.x+size.width},#{origin.y+size.height})" 
      end
    end

CGRect originally is a C-struct. With RubyMotion you can handle it as a class.
This app shows 10 sprites moving around the screen. You can increase the number of sprites to i.e. 1000 setting @@NUM_SPRITES=1000 in ViewController. With more than 10 sprites the collision handling is switched off automatically (of cause you can change this behavior as you need).

Usage:  
$ cd SpriteAnimator  
$ rake # shows iPhone simulator  
$ rake simulator device_family=ipad # shows iPad simulator  


LICENSE
------- 
This repository's source code is under MIT license so you may reuse the software under the following conditions:

Copyright (c) 2012 Wolfgang Kubisiak

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Wolfgang Kubisiak

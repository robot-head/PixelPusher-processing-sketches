Pixelpusher Queue
=================

This Processing 2.0 app allows to show simple moving images in multiple layers for Pixelpushers. It reads the image data in an array to save time in the scraping process. We had some problems with not so powerfull computers to look for something less ressource hungry.

If no Pixelpusher with strips are found, the app will display a rendering. But note: The rendering won't be shown with a present pixelpusher to save resources!


Explanation:
------------
Just set your canvas size in the main file and edit queue.txt. Each line represents a single animation which will be queued. The syntax for each line is as follows:
duration#image1.png,moveX,moveY,moveMode;image2.png,moveX,moveY,moveMode;imageX.png,moveX,moveY,moveMode;

- duration is measured in frames
- images can be png, jpg, gif (not animated) and will be looked for in the images folder
- complete transparent pixels of the first image will be replaced with the ones of the next image, and so on.
- At least on image will be needed. And the image size must be at least the size of your canvas/board.
- moveX and moveY represent the value for movement each frame
- moveMode can be "endless" or "bounce" (just one for both dimensions so far)

examples:
- 500#alpha_nowhere_w.png,0.5,0,bounce;fire.png,0.5,1,endless
- 500#alpha_nowhere.png,0.5,0,endless;rainbow.png,-0.4,0,endless

Note on the canvas:
The canvas is thought of being in a zig-zag order. 


Text-Rendering:
---------------

CUSTOM CONFIGURATION (type = "c"):
If you just want to render text in an layer, you can do this by replacing the filename of the image..
c#500#txt$text to be written$r*g*b$fontsize$fontname$y
1 2   3   4                  5     6        7        8

1: type of entry (must be "c" for custom configuration)
2: duration in frames
3: identifier must be "txt" to enable text rendering
4: String you want to display (Some forbidden characters are "#",";" and ",")
5: colors red,green,blue, seperated by an "*"
6: fontsize in pixels
7: fontname can be either an Processing compatible name like "Arial-Regular", or an Processing-Font-File "fontname.vlw". The latter can be created with Processing under Tools->"Create Font..."
8: the y-offset

examples (whole line for queue):
- 500#txt$ Dynamic Text $255*255*255$18$Arial-Bold$-1,0.8,0,bounce;rainbow_v.png,0,0.4,endless
- 500#txt$ Dynamic Textfile $0*0*0$16$Default.vlw$4,0.8,0,bounce;fire.png,0.5,0.1,endless

QUICK TEXT (type = "t"):
This type will choose random font & color to the given text.

t#500#text to be written
1 2   3                 

1: type of entry (must be "c" for custom configuration)
2: duration in frames
3: String you want to display (Some forbidden characters are "#",";" and ",")




File purposes:
--------------

Pixelpusher_Queue.pde - Main Application
Observer.pde - The pixelpusher observer
ImageArray.pde - Reads the image into an array, and stores movement data (offsets)
Parallax.pde - Allows to stack images on top of the other
Queue.pde - Handles the queue of multiple Parallax's 

queue.txt - File with queue-data, which will be read on setup


Disclaimer:
-----------
This is quite rough code, so expect to find bugs in it. Feel free to use it as you wish. Fork it, make it better, make it greater! A better in code documentation might come later..


Thanks:
-------
Thanks to all of the heroicrobots-forum samples (e.g. zig zag and more)


Copyright:
----------
There is none! Use it, copy it, improve it, make the worst and best out of it.
Written by @peterkling, powered by @LukeSIX


Version History:
----------------

0.3:
- Queue Autoreload
- Quick Text
- WARNING: SYNTAX CHANGED A BIT, OLD queue.txt WON'T WORK (just put "c#" in front of each your old lines and it should work again)
- The readme got written weeks later, so I hope everything is correct about the changes :)

0.2:
- Simulation Mode
- Dynamic Text Rendering

0.1:
- Basic Functionality, queued Parallax images

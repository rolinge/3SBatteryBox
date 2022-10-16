// combo box for string
BatBoxSize=1; // [0:3S, 1:2S, 2:4S]
// Checkbox to show only face
faceOnly=false;  //Render only the section with the cutouts for debugging

include <vars.scad>;

echo ("Index to Number of Batteries=", BatBoxSize) ;
echo ("BatBox = ", BatBox);
echo ("size = ", BatBox[BatBoxSize]);

// simple 2D -> 3D extrusion of a rectangle
color("red")
   difference() {
        linear_extrude(height = h)
            square(BatBox[BatBoxSize], center = true);
       translate ([0,0,basethickness])
         linear_extrude(height = h)
            square([BatBox[BatBoxSize].x-2*wall, BatBox[BatBoxSize].y-2*wall
            ], center = true)   ;
            //  Hole for the small switch
      translate([-BatBox[BatBoxSize].x/4+wireholddiameter/2,BatBox[BatBoxSize].y/2+1,switchcutout.x+2*wall])
      rotate([90,90,0])
          linear_extrude(height = 5)
            square(switchcutout, center = false);
// Hole for the wires
      translate([+BatBox[BatBoxSize].x/4,BatBox[BatBoxSize].y/2+1,h/3*.8])
      rotate([90,0,0])
      cylinder(h = wall*5,
              r1 = wireholddiameter/2,
              r2 = wireholddiameter/2,
              $fn = 36,
              center = false);  //Dimension of posts in x and y

// this hole is for a small voltmeter
    smallVoltmeter([voltMeterXOffset[BatBoxSize],BatBox[BatBoxSize].y/2+2,h/2],[90,0,0]);
     //smallVoltmeter([5,BatBox[BatBoxSize].y/2+2,h/2],[90,0,0]);

     // Hole for the USB Charging connector
     usbC15VBoard(size=Usb15Package ,
                    translation=[-BatBox[BatBoxSize].x/2+wall+1,
                    BatBox[BatBoxSize].y/2-Usb15Package.x+.01,wall+2],
                    rotation=[90,0,90]);

    if (faceOnly) {
      color("purple")
      translate([-BatBox[BatBoxSize].x/2-1,-BatBox[BatBoxSize].y/2-23.5,-wall])
          rotate([0,0,0])
          linear_extrude(height = h+3*wall)
          square([BatBox[BatBoxSize].x+1+wall,BatBox[BatBoxSize].y+1+wall], center = false);
    }

}

if (!faceOnly)
{
  sidepost(BatBox[BatBoxSize].x/2-wall-postsize[0],-BatBox[BatBoxSize].y/2+wall + 2*postloc);
  sidepost(-BatBox[BatBoxSize].x/2+wall,-BatBox[BatBoxSize].y/2+wall + 2*postloc);
  sidepost(BatBox[BatBoxSize].x/2-wall-postsize[0],-BatBox[BatBoxSize].y/2+wall + postloc);
  sidepost(-BatBox[BatBoxSize].x/2+wall,-BatBox[BatBoxSize].y/2+wall + postloc);


  holdslot(  BatBox[BatBoxSize].x/2-wall-holdslotwidth,
           -BatBox[BatBoxSize].y/2+wall + holdslotloc,
            holdslotwidth);

  holdslot(  -BatBox[BatBoxSize].x/2+wall,
            -BatBox[BatBoxSize].y/2+wall  + holdslotloc,
            holdslotwidth);
}
holdslot(  -BatBox[BatBoxSize].x/2+wall,BatBox[BatBoxSize].y/2-Usb15Package.x-1.2,holdslotwidth,
  postcolor="pink");

// posts for standoff for voltmeter       smallVoltmeter([5,BatBox[BatBoxSize].y/2+2,h/2],[90,0,0]);

smallPost(size=[2,6-wall,h/2+voltMeterCutout.y/2-wall+2],
  translation=[-2+voltMeterXOffset[BatBoxSize],BatBox[BatBoxSize].y/2-6,wall]);
smallPost(size=[2,6-wall,h/2+voltMeterCutout.y/2-wall+2],
  translation=[voltMeterCutout.x+voltMeterXOffset[BatBoxSize],BatBox[BatBoxSize].y/2-6,wall], color="black");

smallPost(size=[.8,Usb15.x*0.6,Usb15Package.y],
  translation=[-BatBox[BatBoxSize].x/2+wall,BatBox[BatBoxSize].y/2-wall-Usb15.x*0.6,wall]);
smallPost(size=[Usb15Package.z,Usb15Package.y,2],
  translation=[-BatBox[BatBoxSize].x/2+wall,BatBox[BatBoxSize].y/2-wall-Usb15.x*0.6,wall], color="gray");
// For debugging, draw the Usb15Package
//smallPost(size=Usb15blackPackage, translation=[-BatBox[BatBoxSize].x/2+wall, BatBox[BatBoxSize].y/2-Usb15Package.x, wall], rotation=[90,0,90]);

module sidepost(x=0,y=0, postcolor="blue") {
   color(postcolor)
    translate ([x,y,basethickness])

        linear_extrude(height = h/2.3-basethickness)
            square(postsize, center = false);
}

module smallVoltmeter(translation=[0,0,0], rotation=[0,0,0], color="green")
{
  color(color)
  translate(translation)
  rotate(rotation)
      linear_extrude(height = 5)
          square(voltMeterCutout,
          center = false);
}

module usbC15VBoard(size=[0,0,0],translation=[0,0,0], rotation=[0,0,0], color="lightblue")
{
  color(color)
  translate(translation)
  rotate(rotation)
      linear_extrude(height = size.z)
          square([size.x,size.y],
          center = false);

}
module holdslot(x=0,y=0, width=10, postcolor="yellow") {
   color(postcolor)
    translate ([x,y,basethickness])

        linear_extrude(height = h/2.5-basethickness)
            square([width, 3
            ], center = false);
}

// generic module for making a square post
module smallPost(size=[0,0,0],translation=[0,0,0], rotation=[0,0,0], color="blue") {
   color(color)
    translate (translation)
    rotate(rotation)
    linear_extrude(height = size.z)
            square([size.x,size.y ], center = false);
}

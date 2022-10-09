include <vars.scad>;
// simple 2D -> 3D extrusion of a rectangle
color("red")
   difference() {
        linear_extrude(height = h)
            square(batteryHolder3s, center = true);
       translate ([0,0,basethickness])
         linear_extrude(height = h)
            square([batteryHolder3s.x-2*wall, batteryHolder3s.y-2*wall
            ], center = true)   ;
            //  Hole for the small switch
      translate([-batteryHolder3s.x/4+wireholddiameter/2+3,batteryHolder3s.y/2+1,switchcutout.x+2*wall])
      rotate([90,90,0])
          linear_extrude(height = 5)
              square(switchcutout, center = false);
// Hole for the wires
      translate([+batteryHolder3s.x/4,batteryHolder3s.y/2+1,h/3*.8])
      rotate([90,0,0])
      cylinder(h = wall*5,
              r1 = wireholddiameter/2,
              r2 = wireholddiameter/2,
              $fn = 36,
              center = false);  //Dimension of posts in x and y

// this hole is for a small voltmeter
    smallVoltmeter([2,batteryHolder3s.y/2+2,h/2],[90,0,0]);
     //smallVoltmeter([5,batteryHolder3s.y/2+2,h/2],[90,0,0]);

     // Hole for the USB Charging connector
     usbC15VBoard(size=Usb15Package ,
                    translation=[-batteryHolder3s.x/2+wall+1,
                    batteryHolder3s.y/2-Usb15Package.x+.01,wall+2],
                    rotation=[90,0,90]);


       }
sidepost(batteryHolder3s.x/2-wall-postsize[0],-batteryHolder3s.y/2+wall + 2*postloc);
sidepost(-batteryHolder3s.x/2+wall,-batteryHolder3s.y/2+wall + 2*postloc);
sidepost(batteryHolder3s.x/2-wall-postsize[0],-batteryHolder3s.y/2+wall + postloc);
sidepost(-batteryHolder3s.x/2+wall,-batteryHolder3s.y/2+wall + postloc);


holdslot(  batteryHolder3s.x/2-wall-holdslotwidth,
         -batteryHolder3s.y/2+wall + holdslotloc,
          holdslotwidth);

holdslot(  -batteryHolder3s.x/2+wall,
          -batteryHolder3s.y/2+wall  + holdslotloc,
          holdslotwidth);

holdslot(  -batteryHolder3s.x/2+wall,batteryHolder3s.y/2-Usb15Package.x-wall-4,holdslotwidth);
holdslot(  -batteryHolder3s.x/2+wall,batteryHolder3s.y/2-Usb15Package.x-wall-1.2,holdslotwidth);

// posts for standoff for voltmeter       smallVoltmeter([5,batteryHolder3s.y/2+2,h/2],[90,0,0]);

smallPost(size=[2,6-wall,h/2+voltMeterCutout.y/2-wall+2],
  translation=[0,batteryHolder3s.y/2-6,wall]);
smallPost(size=[2,6-wall,h/2+voltMeterCutout.y/2-wall+2],
  translation=[voltMeterCutout.x+2,batteryHolder3s.y/2-6,wall]);
// For debugging, draw the Usb15Package
//smallPost(size=Usb15Package, translation=[-batteryHolder3s.x/2+wall, batteryHolder3s.y/2-Usb15Package.x, wall], rotation=[90,0,90]);

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

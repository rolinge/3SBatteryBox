include <vars.scad>;
// simple 2D -> 3D extrusion of a rectangle
color("red")
   difference() {
        linear_extrude(height = h)
            square([w, l], center = true);
       translate ([0,0,basethickness])
         linear_extrude(height = h)
            square([w-2*wall, l-2*wall
            ], center = true)   ;
            //  Hole for the small switch
      translate([-w/4+wireholddiameter/2+3,l/2+1,switchcutout.x+2*wall])
      rotate([90,90,0])
          linear_extrude(height = 5)
              square(switchcutout, center = false);
// Hole for the wires
      translate([+w/4,l/2+1,h/3*.8])
      rotate([90,0,0])
      cylinder(h = wall*5,
              r1 = wireholddiameter/2,
              r2 = wireholddiameter/2,
              $fn = 36,
              center = false);  //Dimension of posts in x and y

// this hole is for a small voltmeter translate([-w+23.5+8*wall,l/2+1,basethickness+6])
     smallVoltmeter([5,l/2+2,h/2],[90,0,0]);
// Hole for the USB Charging connector
     usbC15VBoard(size=Usb15Package ,
                    translation=[-w/2+wall+1,l/2-Usb15Package.x+.01,wall+2],
                    rotation=[90,0,90]);
// Subtract a box to just leave the face for quick test print
       }



//holdslot(  -w/2+wall,l/2-Usb15Package.x-wall-4,holdslotwidth);

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

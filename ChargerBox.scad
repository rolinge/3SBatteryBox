include <vars-charger.scad>;
// simple 2D -> 3D extrusion of a rectangle
color("red")
   difference() {
        linear_extrude(height = h)
            square([w, l
            ], center = true);
       translate ([0,0,basethickness])
         linear_extrude(height = h)
            square([w-2*wall, l-2*wall
            ], center = true)   ;
    translate([w/4,l/2+1,h/3])
    rotate([90,0,0])
    cylinder(h = wall*2,
            r1 = wireholddiameter/2,
            r2 = wireholddiameter/2,
            $fn = 36,
            center = false);  
    translate([-w/4,-l/2+wall+1,h/3])
    rotate([90,0,0])
    cylinder(h = wall*3,
            r1 = wireholddiameter/2,
            r2 = wireholddiameter/2,
            $fn = 36,
            center = false);  
      }

mountpost(13,postloc);
mountpost(13,-postloc);
mountpost(-13,postloc);
mountpost(-13,-postloc);

module mountpost(x=0,y=0, postcolor="blue") {
    color(postcolor)
    translate ([x,y,basethickness])
   difference() {
     linear_extrude(height = postheight)
            square([2*postradius,2*postradius], center = true);
    //cylinder(h=postheight, r1=postradius, r2=postradius,  $fn = 12,center = false);
    translate ([0,0,-1])
    cylinder(h=postheight+2, r1=postholeradius, r2=postholeradius,  $fn = 12,
center = false);
   }

}


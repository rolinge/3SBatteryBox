include <vars.scad>;
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
    translate([-w/4,l/2+1,h/3*2])
    rotate([90,0,0])
    cylinder(h = wall*5,
            r1 = wireholddiameter/2,
            r2 = wireholddiameter/2,
            $fn = 36,
            center = false);  //Dimension of posts in x and y
    translate([0,l/2+1,h/3])
    rotate([90,0,0])
        linear_extrude(height = 5)
            square(switchcutout, center = false);

    translate([-w+23.5+8*wall,l/2+1,basethickness+6])
    rotate([90,0,0])
        linear_extrude(height = 5)
            square(voltmetercutout,
            center = false);

       }


sidepost(w/2-wall-postsize[0],-l/2+wall + 2*postloc);
sidepost(-w/2+wall,-l/2+wall + 2*postloc);
sidepost(w/2-wall-postsize[0],-l/2+wall + postloc);
sidepost(-w/2+wall,-l/2+wall + postloc);


holdslot(  w/2-wall-holdslotwidth,
          -l/2+wall + holdslotloc,
           holdslotwidth);

holdslot(  -w/2+wall,
           -l/2+wall  + holdslotloc,
           holdslotwidth);

module sidepost(x=0,y=0, postcolor="blue") {
   color(postcolor)
    translate ([x,y,basethickness])

        linear_extrude(height = h/3-basethickness)
            square(postsize, center = false);
}

module holdslot(x=0,y=0, width=10, postcolor="yellow") {
   color(postcolor)
    translate ([x,y,basethickness])

        linear_extrude(height = h/3-basethickness)
            square([width, 3
            ], center = false);
}

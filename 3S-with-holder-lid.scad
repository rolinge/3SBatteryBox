
//Cover with a slot for the wire egress
//All dimensions are in mm
// combo box for string
BatBoxSize=1; // [0:3S, 1:2S, 2:4S]

// Create the exterior box, subtract the interior, and subtract the slot.

include <vars.scad>;
translate ([0,0,0])
linear_extrude(height = wall)
            square([BatBox[BatBoxSize].x, BatBox[BatBoxSize].y
            ], center = true);
 // now the inside rim is another box minus a other box...
 //  taking into account that we need to give some slip fit with the interference parameter
 color("blue")
 translate ([0,0,wall-.1])
 difference() {
    linear_extrude(height = wall)
            square([BatBox[BatBoxSize].x-2*wall-interference, BatBox[BatBoxSize].y-2*wall-interference
            ], center = true);
    linear_extrude(height = wall+.1)
            square([BatBox[BatBoxSize].x-4*wall, BatBox[BatBoxSize].y-4*wall
            ], center = true);
}

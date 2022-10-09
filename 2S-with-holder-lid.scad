//Cover with a slot for the wire egress
//All dimensions are in mm


// Create the exterior box, subtract the interior, and subtract the slot.

include <vars.scad>;
translate ([0,0,0])
linear_extrude(height = wall)
            square([batteryHolder2s.x, batteryHolder2s.y
            ], center = true);
 // now the inside rim is another box minus a other box...
 //  taking into account that we need to give some slip fit with the interference parameter
difference() {
    linear_extrude(height = basethickness)
            square([batteryHolder2s.x-2*wall-interference, batteryHolder2s.y-2*wall-interference
            ], center = true);
    translate ([0,0,0])
    linear_extrude(height = basethickness)
            square([batteryHolder2s.x-4*wall-interference, batteryHolder2s.y-4*wall-interference
            ], center = true);
}

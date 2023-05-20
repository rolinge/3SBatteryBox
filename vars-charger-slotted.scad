echo(version=version());
//All dimensions are in mm
wall=2;  // wall thickness

l = 81; // lenght of box in x dir
w = 25.5+2*wall ;  // width of box in y dir
h=26;    // height of box without lid
postloc_x=11; // where the edge posts are in x direction
postloc_y=23.5; // where the edge posts are in y direction
postradius=2.5 ;  //Dimension of posts in x and y
postholeradius=1.35;
postheight=7;
basethickness=3;
slotThickness = 1.7;
recess=.7;
holdslotloc=81.5;
holdslotwidth=10;
wireholddiameter = 6;
switchcutout = [28,22];
//Perforation size: 23mm*10.5mm
voltmetercutout=[24,11.5];
// Allow for slip by making the ridge a little smaller than the box it fits into.
interference=0.8;

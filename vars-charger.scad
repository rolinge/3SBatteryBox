echo(version=version());
//All dimensions are in mm

l = 71; // lenght of box in x dir
w = 34;  // width of box in y dir
h=26;    // height of box without lid
wall=2;  // wall thickness
postloc=23.5; // where the edge posts are in y direction
postradius=2 ;  //Dimension of posts in x and y
postholeradius=1.25;
postheight=8;
basethickness=3;
holdslotloc=81.5;
holdslotwidth=10;
wireholddiameter = 6;
switchcutout = [28,22];
//Perforation size: 23mm*10.5mm
voltmetercutout=[24,11.5];
// Allow for slip by making the ridge a little smaller than the box it fits into.
interference=0.8;

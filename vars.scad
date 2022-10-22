echo(version=version());
//All dimensions are in mm


BatBox=[[68,110.0],[50,110.0], [86.0,110.0]];
voltMeterXOffset = [0.0, -5.0, -2,0];
batteryHolder3s=[68,110.0];
batteryHolder2s=[50,106.0];
h=32;    // height of box without lid
wall=2;  // wall thickness
postloc=28; // where the edge posts are in y direction
postsize=[0.85,3] ;  //Dimension of posts in x and y
basethickness=3;
holdslotloc=81.5;
holdslotwidth=10;
wireholddiameter = 5.5;
switchcutout = [13.7, 9.2];
switchDepth = 16.0;
//Perforation size: 23mm*10.5mm
voltMeterCutout=[24,11.5];
// Allow for slip by making the ridge a little smaller than the box it fits into.
interference=1.2;
Usb15=[17.2,12.1];
usbCPortStandoff=2.0;
usbConnector=[10,7.0,4.2];
circuitBoardThick=2.0;
barrelHoleDiameter=8.6;

Usb15Package=[Usb15.x+usbCPortStandoff, Usb15.y,circuitBoardThick+usbConnector.z];

echo(version=version());
//All dimensions are in mm


batteryHolder3s=[69,110.0];
batteryHolder2s=[50,106.0];
h=32;    // height of box without lid
wall=2;  // wall thickness
postloc=28; // where the edge posts are in y direction
postsize=[1.85,3] ;  //Dimension of posts in x and y
basethickness=3;
holdslotloc=81.5;
holdslotwidth=10;
wireholddiameter = 5.0;
switchcutout = [13.7, 9.2];
switchDepth = 16.0;
//Perforation size: 23mm*10.5mm
voltMeterCutout=[24,11.5];
// Allow for slip by making the ridge a little smaller than the box it fits into.
interference=0.8;
Usb15=[17.2,11.7];
usbCPortStandoff=2.0;
usbConnector=[10,7.0,4.2];
circuitBoardThick=2.0;

Usb15Package=[Usb15.x+usbCPortStandoff, Usb15.y,circuitBoardThick+usbConnector.z];

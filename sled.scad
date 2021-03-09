/* Marc Amil 
Project date: 20.2.2021
Deadline: 23.2.2021

PROJECT: ABRASIVE TESTING:  Sled
*/
/////////PARAMETERS////////////////
// 1 unit = 1 mm
$fn = 70;

// SLED PARAMETERS 

sled_width =  58;
sled_height = 100;
sled_depth = 20;
sled_hole_height = 150; 
sled_hole_radius = 4;


rotate([0,0,90]) {
   translate([-29,-50,-32]) {
    sled();
    }
}

 module sled(){
    difference() {
   cube([sled_width, sled_height, sled_depth]);
      rotate([90, , ]) {
    translate([29, 10, -120]) {
      cylinder(h = sled_hole_height, r  = sled_hole_radius);
            }
        }
    }
}
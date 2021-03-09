/* Marc Amil 
Project date: 20.2.2021
Deadline: 23.2.2021

PROJECT: ABRASIVE TESTING: Flywheel component (fw)
*/

/////////PARAMETERS////////////////
// Every unit = 1mm
$fn = 70; 

// Core Body Parameters of Flywheel
fwH = 9; 
fwR = 40;
// Inner Hole Parameters of Flywheel
innerholeR = 3;
//e = .02;
// Cylinder extrusion for wire attached to flywheel
wireholeR = 1;


//////RENDERING///////////////////
fw();


module fw() {
	difference() {
		 cylinder (h = fwH, r = fwR, center = true);
		
		union() {
			difference(){
				cylinder(h = fwH, r = innerholeR, center = true);
				translate([2.5, -3, -15])
					cube([6,6,50]);
			}
			
			for (i = [6: 4: 42]) {
				rotate([0, 0, 4*i])
				translate([i, 0, -10])
					union() {
						cylinder(h = 3*fwH, r = wireholeR);
						translate([-3, 0, 10+fwH/2-1])
						linear_extrude(2)
							#text(str(i), size = 1.4);
					}
				
			}
		}
	} 
}
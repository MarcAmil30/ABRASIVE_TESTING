/* Marc Amil 
Project date: 20.2.2021
Deadline: 23.2.2021

PROJECT: ABRASIVE TESTING:  Housing 
*/
/////////PARAMETERS////////////////
// 1 unit = 1 mm
$fn = 70;
//OUTER CASING FOR HOUSING
outer_housing_width = 65;
outer_housing_height = 65;
outer_housing_depth = 65;
//INNER CASING FOR HOUSING  --> USE TO MAKE THE HOLES 
inner_housing_width = 60;
inner_housing_height = 80;
inner_housing_depth = 60;

//SLITS FOR THE CASING --> FOR SLED TO SLIDE THROUGH 
slit_housing_width = 150;
slit_housing_height = 30;
slit_housing_depth = 60;

// HINGES ON BOTH SIDES FOR FIXATION
hinge_housing_width = 80;
hinge_housing_height = 30;
hinge_housing_depth = 5;


// CYLINDER HOLE FOR HINGES --> FIXED BY SCREWS 
hinge_hole_height = 15;
hinge_hole_radius = 2;

// SLED PARAMETERS 


/////////RENDERS//////////////////
housing();
Hinge();
mirror([0,1,0]) {
    Hinge();
}



////////MODULES//////////////////
module housing() {
    difference(){
        cube([outer_housing_width, outer_housing_depth, outer_housing_height], center = true);
        cube([inner_housing_width, inner_housing_depth, inner_housing_height], center = true);
        translate([30,0, -25]) {
    cube([slit_housing_width, slit_housing_depth, slit_housing_height], center = true); 
        }
    }
}

module hingescube() {
    rotate([90, 0, 0]) {
        translate([0,-28,40]) {
    cube([hinge_housing_width, hinge_housing_depth, hinge_housing_height], center = true);
        } 
    }
}

module hingeshole() {
    cylinder( h  = hinge_hole_height, r = hinge_hole_radius, center = true);
}


module Hinge(){
   translate([0, -5,-2]){
difference() {
        hingescube();
       translate([-20,-45,-30]) {
        hingeshole();
       }
       translate([20,-45,-30]) {
         hingeshole();
       }
   }
 }
}
 

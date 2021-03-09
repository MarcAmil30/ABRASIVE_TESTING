/* Marc Amil
Project date: 28/12/2020
Deadline: 30/12/2020

PROJECT: PROPELLER FOR MYCELIUM BIOREACTOR 
four bladed paddle used for a mixing close to the bottom of a tank.
*/
//

//////////////////////////////////////////////////////////////////////////////PARAMETERS////////////////////////////////////////////////////////////////////////////////////
// I assume that every unit is in mm 
$fn = 100;

//BLADE PARAMETERS 
blade_length = 100;  
blade_width = 2;
blade_height = 50;


//HINGE PARAMETERS
hinge_height = 15;
hinge_width = 5;
hinge_length = 5;

//CORE PARAMETERS 
outercore_height = 30;
outercore_radius = 15;
innercore_height = 60;
innercore_radius = 10;

////////////////////////////////////////////////////////////////////////////RENDERS////////////////////////////////////////////////////////////////////////////////////////
core();

translate([20, 0, 25])
union(){
    hinge(hinge_height, hinge_width, hinge_length);
    blades(blade_height, blade_width, blade_length);
}


mirror([1,0,0])
translate([20, 0, 25])
union(){
    hinge(hinge_height, hinge_width, hinge_length);
    blades(blade_height, blade_width, blade_length);
}


rotate([0,0,90])
translate([20, 0, 25])
union(){
    hinge(hinge_height, hinge_width, hinge_length);
    blades(blade_height, blade_width, blade_length);
}


mirror([0,1,0])
rotate([0, 0, 90])
translate([20, 0, 25])
union() {
    hinge(hinge_height, hinge_width, hinge_length);
    blades(blade_height, blade_width, blade_length);
}
//


/////////////////////////////////////////////////////////////////////////////MODULES/////////////////////////////////////////////////////////////////////////////////////

module core(){
   difference(){
       cylinder(h = outercore_height, r = outercore_radius, center = true);
        cylinder(h = innercore_height , r = innercore_radius, center = true);
   }
}


module hinge(hinge_height, hinge_width, hinge_length){
        translate([-5, 0, -35])
        cube([hinge_width, hinge_length, hinge_height]);       
}



module blades(blade_height, blade_width, blade_length){
          rotate([0, 90, 0])
            translate([-1, 1, -1])
            cube([blade_height, blade_width, blade_length]);
}














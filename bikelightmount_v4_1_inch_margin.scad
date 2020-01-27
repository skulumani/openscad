//Velcro and Ziptie Bike Light Mount
//Remixed by Alice Ferng November 2015
//Adapted from http://www.thingiverse.com/thing:250899

//Bike parameters
//European style handles are 26 mm
//1 inch = 25.4mm

//all measurements are in mm
light_thickness = 26.4;
bar_thickness = 26.4;
zip_thickness = 6.7;
velcro_thickness = 25.4;

/* [Build Plate] */

//for display only, doesn't contribute to final object
build_plate_selector = 0; //[0:Replicator 2,1: Replicator,2:Thingomatic,3:Manual]

//when Build Plate Selector is set to "manual" this controls the build plate x dimension
build_plate_manual_x = 100; //[100:400]

//when Build Plate Selector is set to "manual" this controls the build plate y dimension
build_plate_manual_y = 100; //[100:400]

build_plate(build_plate_selector,build_plate_manual_x,build_plate_manual_y);

//build plate downloaded from thingiverse: http://www.thingiverse.com/thing:44094

/* [Hidden] */

//holder box
box_height = bar_thickness+light_thickness-17.6;

use <utils/build_plate.scad>

module holder(){
    difference(){
        cube([bar_thickness+10.8, light_thickness+6.8, box_height],center=true);	
        
        translate([0,0,box_height/2]) rotate([0,90,0]) 
            cylinder(r=light_thickness/2, h=bar_thickness+20, center=true);
        
        translate([0,0,-box_height/2]) rotate([90,90,0]) 
            cylinder(r=bar_thickness/2, h=light_thickness+20, center=true);
    } 
}

module ziptie_bottom(){
difference(){
	translate([0,0,-box_height/2]) rotate([90,90,0]) 
        cylinder(r=bar_thickness/2+6, h=zip_thickness, center=true);
	translate([0,0,-box_height/2]) rotate([90,90,0]) 
        cylinder(r=bar_thickness/2+3, h=bar_thickness+20, center=true);
	}
}

module velcro_top(){
	difference(){
		translate([0,0,box_height/2]) rotate([0,90,0]) cylinder(r=light_thickness/2+6, h=velcro_thickness, center=true);
		translate([0,0,box_height/2]) rotate([0,90,0]) cylinder(r=light_thickness/2+3, h=bar_thickness+20, center=true);
	}
}

    	translate([0,0,box_height/2]){
	difference(){
		holder();
			translate([(velcro_thickness)*0,0,0]) 
        velcro_top();
			translate([0,(light_thickness+6.8)*.25,0]) ziptie_bottom();
			translate([0,(light_thickness+6.8)*-.25,0]) ziptie_bottom();
		}
	}
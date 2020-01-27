// mount for carbon fiber tube

$fs = 1;
$fa = 0.4;

inner_tube_thickness = 1;
bar_diameter = 22+inner_tube_thickness;
tol = 0.001;
mount_width = 35;
mount_standoff = 35;
mount_height = 26;
flashlight_diameter = 21+inner_tube_thickness;

flashlight_width = 30;

bar_flashlight_gap = 8;

bar_overhang = bar_diameter/2;
flashlight_overhang = flashlight_diameter/2;

module zip_tie(zip_tie_width=6, zip_tie_radius = 30, zip_tie_height = 2) {
rotate([0, 0, 0])
difference() {
// outside
cylinder(r=zip_tie_radius+zip_tie_height, h=zip_tie_width, center=true);
// inside
cylinder(r=zip_tie_radius, h=zip_tie_width+tol, center=true);
}   
}

module flashlight(diameter=24, lenght=50) {
    rotate([0, 90, 0])
    cylinder(r=diameter/2, h=lenght, center=true);
}


module bar_mount() {
difference() {
    resize([mount_width, 15, bar_diameter+3])
cube([mount_width, 1, 1], center=true);

translate([0, bar_diameter/2 , 0])
rotate([0, 90, 0])
cylinder(r=bar_diameter/2, h=mount_width+5, center=true);
    
    // zip tie cut out
    translate([-mount_width/2+5, bar_diameter/2, 0])
 zip_tie(zip_tie_radius=bar_diameter/2+7);

translate([mount_width/2-5, bar_diameter/2, 0])
 zip_tie(zip_tie_radius=bar_diameter/2+7);

//translate([0, -flashlight_diameter/2-bar_flashlight_gap/2, 0])
//flashlight();
}

}

//bar_mount();
module flashlight_mount() {
difference() {
    resize([flashlight_width, flashlight_diameter+3, flashlight_diameter+1]) 
    cube([mount_width, 1, 1], center=true);
    
    translate([0, flashlight_diameter/2 , 0]){
rotate([0, 90, 0])
cylinder(r=flashlight_diameter/2, h=flashlight_width+5, center=true);

zip_tie(zip_tie_radius=flashlight_diameter/2+3, zip_tie_width=20);
    }

translate([0, -13, 0])
cube([mount_width, flashlight_diameter, flashlight_diameter+10], center=true);
}
}

/* translate([0, 7, 0]) */
/* bar_mount(); */
/* translate([0, -5, 0]) */
/* rotate([180, 0, 0]) */
/* flashlight_mount(); */

cube_height = flashlight_diameter/2+bar_diameter/2+bar_flashlight_gap;
flashlight_center = [0, 0, cube_height/2];
bar_center = [0, 0, -cube_height/2];

translate([0, 0, mount_width/2])
rotate([90, 0, 0])
difference() {
cube([mount_height, mount_width, cube_height], center=true);
translate(bar_center) rotate([90, 0, 0]) cylinder(r=bar_diameter/2, h=mount_width+5, center=true);
translate(flashlight_center) rotate([90, 0, 0]) cylinder(r=flashlight_diameter/2, h=mount_width+5, center=true);
// flashlight zip ties/velcro
translate(flashlight_center) rotate([90, 0, 0]) zip_tie(zip_tie_width=14, zip_tie_radius=mount_height/2, zip_tie_height=2);

// bar zip ties
translate([0, -mount_width/2+7, 0]) translate(bar_center) rotate([90, 0, 0]) zip_tie(zip_tie_width=6, zip_tie_radius=mount_height/2, zip_tie_height=2);
translate([0, mount_width/2-7, 0]) translate(bar_center) rotate([90, 0, 0]) zip_tie(zip_tie_width=6, zip_tie_radius=mount_height/2, zip_tie_height=2);
}


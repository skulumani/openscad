
$fs = 1;
$fa = 0.4;

total_height = 135;
bowl_diameter = 110;

wall_thickness = 5;
top_diameter = bowl_diameter - 20;
base_diameter = 110;

points = [
        [base_diameter/2-wall_thickness*2, 0],
        [base_diameter/2, 0], 
        [base_diameter/2, total_height],
        [base_diameter/2-wall_thickness, total_height],
        [base_diameter/2-2*wall_thickness, total_height-wall_thickness]];

difference() {
rotate_extrude() polygon(points=points);
translate([0, 0, 70])
cube(size =[50, 200, 90], center=true);
rotate([0,0,90])
translate([0, 0, 70])
cube(size =[50, 200, 90], center=true);
}


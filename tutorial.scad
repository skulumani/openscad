$fa =1;
$fs = 0.4;

// variables
base_height = 5;
top_height = 8;

track = 20;
wheel_base = 40;

wheel_turn = 20;
body_roll = 3;

wheel_radius = 10;
wheel_hub_thickness = 2;
wheel_thickness = 5;
side_wheel_radius = 8;

// base
scale([1.2, 1, 1.2]){
    rotate([body_roll, 0, 0]) {
        resize([wheel_base*2, 1*track, 2*base_height])
    sphere(r=track/2);
    //cabin
    translate([10, 0, 4])
        scale([1.5, 0.6, 0.6])
        sphere(r=track/2);
 
        }
 
// front left wheel
translate([-wheel_base/2, -track, 0])
 rotate([0, 0, -wheel_turn])
resize([20, 8, 20])
sphere(r=wheel_radius);
// front right
translate([-wheel_base/2, track, 0])
 rotate([0, 0, -wheel_turn])
 resize([20, 8, 20])

sphere(r=wheel_radius);
//back right
translate([wheel_base/2, track, 0])
 resize([20, 8, 20])
sphere(r=wheel_radius);
//back left
translate([wheel_base/2, -track, 0])
 resize([20, 8, 20])
sphere(r=wheel_radius);

// front axel
translate([-wheel_base/2, 0, 0])
rotate([90, 0, 0])
cylinder(h=track*2+0.002, r=2, center=true);
//rear axle
translate([wheel_base/2, 0, 0])
rotate([90, 0, 0])
cylinder(h=track*2+0.002, r=2, center=true);
}



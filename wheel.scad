
module wheel(wheel_radius=10, side_wheel_radius=50, wheel_hub_thickness=4, cylinder_radius=2) {



cylinder_height = 2*wheel_radius;

difference() {
sphere(r=wheel_radius);
translate([0, side_wheel_radius+wheel_hub_thickness/2, 0])
    sphere(r=side_wheel_radius);
    
    translate([0, -side_wheel_radius-wheel_hub_thickness/2, 0])
    sphere(r=side_wheel_radius);
    
    //holes in wheel
    translate([5, 0 , 0])
    rotate([90, 0, 0])
    cylinder(r=cylinder_radius, h=cylinder_height, center=true);
    
    translate([-5, 0 , 0])
    rotate([90, 0, 0])
    cylinder(r=cylinder_radius, h=cylinder_height, center=true);
    
    translate([0, 0 , -5])
    rotate([90, 0, 0])
    cylinder(r=cylinder_radius, h=cylinder_height, center=true);
    
    translate([0, 0 , 5])
    rotate([90, 0, 0])
    cylinder(r=cylinder_radius, h=cylinder_height, center=true);
}
}

wheel(wheel_radius = 10,
wheel_hub_thickness = 4,
side_wheel_radius = 50,
cylinder_radius = 2);

translate([0, 20, 0])
wheel(10, 10, 2, 2);
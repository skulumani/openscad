// mount for carbon fiber tube

bar_radius = 22;
tol = 0.001;
mount_width = 35;
mount_height = 10;

zip_tie_width = 6;
difference() {
cube([mount_width, bar_radius/2 + mount_height, bar_radius], center=true);

translate([0, bar_radius/2, 0])
rotate([0, 90, 0])
cylinder(r=bar_radius/2, h=mount_width+5, center=true);
}


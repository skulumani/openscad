use <local.scad>

c1 = new_cs(origin=[0,0,10]);
c2 = new_cs(axes=[[1,0,0],[0,0,1]]);

difference(){
	cube([10,10,10]);
	translate_local(c1,[5,5,-2]) cylinder(r=1,h=3);
	in_cs(c2) union(){
		translate([3,3,-2]) cylinder(r=1,h=3);
		translate([7,7,-2]) cylinder(r=1,h=3);
	}
}

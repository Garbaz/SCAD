negative_diameter = 13;
height = 5.5;

wall_thickness = 1.5;

flute_width = 2;
flute_thickness = 4;

base_width = 40;
base_depth = 40;
base_height = 3;

$fn = 128;

positive_diameter = negative_diameter + 2 * flute_width + wall_thickness;

module Flute() {
    linear_extrude(height, twist=-360/3, slices=128)
    translate([negative_diameter/2,0])
    square([1.5 * flute_width,flute_thickness], center = true);
}

module Negative() {
    cylinder(height, d = negative_diameter);
    Flute();
    rotate([0,0,360/3])
    Flute();
    rotate([0,0,2 * 360/3])
    Flute();
}



translate([0,0,base_height + wall_thickness])
difference() {
translate([0,0,- (wall_thickness + 0.01)])
cylinder(height + wall_thickness, d = positive_diameter);
Negative();
}

minkowski() {
    cube([base_width - 2 * base_height, base_depth - 2 * base_height, 0.01], center = true);
    union() {
        translate([0,0,base_height/2])
        sphere(base_height/2);
        cylinder(base_height/2, r = base_height/2);
    }
}

negative_diameter = 13;
height = 5.5;

wall_thickness = 1.5;

flute_width = 2;
flute_thickness = 4;

top_diameter = 52;

ratio = 1/2;
waist_diameter = 30;

foot_diameter = 75;
foot_height = 25;
foot_rounding_radius = 5;

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



translate([0,0,foot_height + wall_thickness])
difference() {
translate([0,0,- (wall_thickness + 0.01)])
cylinder(height + wall_thickness, d = positive_diameter);
Negative();
}

module RoundedCone(bottom_diameter, top_diameter, height, rounding_radius) {
    bottom_diameter = bottom_diameter - top_diameter - 2 * rounding_radius;
    rotate_extrude()
    union() {
        square([top_diameter/2, height]);
        
        translate([top_diameter/2, rounding_radius])
        difference() {
            square([bottom_diameter/2, height - rounding_radius]);
            translate([bottom_diameter/2, height - rounding_radius])
            scale([bottom_diameter/2, height - rounding_radius])
            circle(1);
        }
        
        translate([top_diameter/2, 0])
        square([bottom_diameter/2, rounding_radius]);
        
        translate([bottom_diameter/2 + top_diameter/2, 0])
        difference() {
            circle(r = rounding_radius);
            translate([-rounding_radius, -rounding_radius])
            square([2 * rounding_radius, rounding_radius]);
        }   
    }
   
}

translate([0, 0, foot_height])
mirror([0, 0, 1])
RoundedCone(top_diameter, waist_diameter, (1-ratio) * foot_height, foot_rounding_radius);

RoundedCone(foot_diameter, waist_diameter, ratio * foot_height, foot_rounding_radius);


!union() {
    rotate_extrude()
    difference() {
        square(10);
        
        translate([10,10])
        circle(10);
    }
}
sphere_diameter = 15;
stem_height = 15;
stem_overhang = 7.5;

base_width = 60;
base_depth = 40;
base_height = 3;

$fn = 128;

module RoundedSquare(width, depth, radius) {
    minkowski() {
        square([width - 2 * radius, depth - 2 * radius], center = true);
        circle(r = radius);
    }
}

translate([0, base_depth/2 + stem_overhang, stem_height + 0.4 * sphere_diameter])
sphere(d = sphere_diameter);

scale([1,1,1.5])
hull() {
    translate([0, base_depth/2 + stem_overhang, stem_height])
    cylinder(2, r = 0.01);
    
    scale([0.5, 1, 1])
    translate([0, 0, base_height/2])
    cylinder(0.01, r = 0.4 * base_depth);
}

//cube([base_width, base_depth, base_height], center = true);
//ChamferedSquare(base_width, base_depth, 4);
//linear_extrude(base_height)
//RoundedSquare(base_width, base_depth, 4);
minkowski() {
    cube([base_width - 2 * base_height, base_depth - 2 * base_height, 0.01], center = true);
    union() {
        translate([0,0,base_height/2])
        sphere(base_height/2);
        cylinder(base_height/2, r = base_height/2);
    }
}

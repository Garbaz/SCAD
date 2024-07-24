inner = 26;
thickness = 3 * 0.4;
outer = inner + 2 * thickness;
height = 15;

$fn = 256;

module cap() {
    difference() {
        cylinder(h = height, r = outer/2);
    
        translate([0,0,thickness])
        cylinder(h = height, r = inner/2);
    }
}

module test() {
    difference() {
        cylinder(h = 3, r = outer/2);
    
        translate([0,0,-1])
        cylinder(h = height, r = inner/2);
    }
}

//test();
cap();
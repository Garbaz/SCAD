// Height of the bird in mm.
bird_height = 2; // [10]

// Height of the base in mm.
base_height = 2; // [10]

// Bird offset in (mm,mm).
bird_offset = [1,1];

// Width of the base in mm.
base_width = 27;

// Depth of the base in mm.
base_depth = 27;

union() {
    translate([bird_offset[0],bird_offset[1],base_height])
    //scale([-1,1,1])
    mirror([1,0,0])
    translate([-25,0,0])
    linear_extrude(bird_height) {
        import("bird.svg");
    };
    
    cube([base_width, base_depth, base_height]);
}
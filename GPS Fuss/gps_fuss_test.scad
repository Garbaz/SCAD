$fn = 128;

sphere_diameter = 15.5;

module Test() {
    translate([0,0,15])
    sphere(d = sphere_diameter);
    cylinder(10,15/2,3);
}

module rotate_to(dir) {
    dir = dir/norm(dir);
    new_up = dir;
    new_left = cross([0,0,1], dir);
    new_forward = cross(new_up, new_left);
    matrix = [[new_left[0], new_forward[0], new_up[0], 0],
              [new_left[1], new_forward[1], new_up[1], 0],
              [new_left[2], new_forward[2], new_up[2], 0]];
    
    multmatrix(matrix)
    children();
}

module slice(plane_offset, plane_dir) {
    
}

rotate_to([1,0,0])
Test();

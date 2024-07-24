//height = 22;
height = 7.5;
bevel_radius = 3;

drawing_width = 38.000;
drawing_height = 32.942;

cross_thickness = 3;
gap = 3.5;

$fn = $preview ? 8 : 128;

module CapShape() {
    minkowski() {
        linear_extrude(0.01)
        translate([-drawing_width/2, -drawing_height/2])
        import("drawing.svg");
        translate([0,0,bevel_radius])
        union() {
            cylinder_height = height - bevel_radius;
            sphere(r = bevel_radius);
            cylinder(h = cylinder_height, r = bevel_radius);
        }
    }
}

module Cross() {
    bar_length = bevel_radius + sqrt(drawing_width * drawing_width + drawing_height * drawing_height)
                 - gap * 2;
    
    module Bar() {
        translate([0,0,height/2])
        cube([bar_length, cross_thickness, height], center = true);
    }
    
    angle = atan2(drawing_height, drawing_width);
    
    rotate([0,0,angle])
    Bar();
    rotate([0,0,-angle])
    Bar();
}

difference() {
    translate([0,0,-1])
    scale([1.1,1.15,1])
    CapShape();
    CapShape();
}

Cross();

width = 31.5;
height = 37;
depth = 22;

waist = 22.5;
inset = (width - waist)/2;

outer = 9;
inner = 7;
transition = (height - 2 * outer - 1 * inner)/2;

rounding_radius = 2;
thickness = 2;

$fn = $preview ? 32 : 64;

module InnerShape() {
    translate([-width/2, -height/2])
    polygon([
        [0, 0],
        [width, 0],
        [width, outer],
        [width - inset, outer + transition],
        [width - inset, height - outer - transition],
        [width, height - outer],
        [width, height],
        [0, height],
        [0, height - outer],
        [inset, height - outer - transition],
        [inset, outer + transition],
        [0, outer],
    ]);
}

linear_extrude(depth - rounding_radius)
difference() {
    offset(r = +rounding_radius)
    offset(delta = thickness - rounding_radius)
    InnerShape();
    
    offset(r = -rounding_radius)
    offset(delta = +rounding_radius)
    InnerShape();
}

minkowski() {
    linear_extrude(0.01)
    offset(r = -rounding_radius)
    offset(delta = +rounding_radius)
    InnerShape();
    
    union() { 
        cylinder(h = rounding_radius, r = rounding_radius);
        sphere(r = rounding_radius);
    }
}
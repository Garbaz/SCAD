width = 48;
length = 71;

height = 4 * 0.2;
seal_width = 3 * 0.4;
outer_corner_radius = 2;
inner_corner_radius = 0.5;

$fn = 50;

linear_extrude(height) {
    difference() {
        minkowski() {
            square([width  - 2 * outer_corner_radius,
                    length - 2 * outer_corner_radius],
                   center = true);
            circle(outer_corner_radius);
        }
        
        minkowski() {
            square([width  - 2 * seal_width - 2 * inner_corner_radius,
                    length - 2 * seal_width - 2 * inner_corner_radius],
                   center = true);
            circle(inner_corner_radius);
        }
    }
}
use <./parts.scad>
base_thickness=2;

module connector() {
    difference() {
        union() {
            cube([35, 47, base_thickness], center = false);

            translate([0, 0, base_thickness]) {
                cube([35, 8.5, 2], center = false);

                translate([0, 47 - 8.5, 0])
                    cube([35, 8.5, 2], center = false);

                translate([35 / 2 - 14 / 2, 47 / 2 - 14 / 2, 0])
                    cube([14, 14, 2], center = false);
            }
        }

        translate([0, 0, base_thickness]) {
            translate([35 / 2 - 20 / 2, 6.5 - 2.5, 0])
                cube([20, 10, 2], center = false);

            translate([35 / 2 - 20 / 2, 30.5 + 2.5, 0])
                cube([20, 10, 2], center = false);
        }

        /*
*/
    }
}



module distance_holder() {
    difference() {
        cube([70.6, 70.6, 4], center = false);

        outer_ring_d = 1.5;
        translate([outer_ring_d, outer_ring_d, 0]) {
            cube([70.6 - outer_ring_d*2, 10, 8], center = false);

            translate([0, 70.6 - 10 - outer_ring_d*2, 0])
                cube([70.6 - outer_ring_d*2, 10, 8], center = false);
        }

        translate([outer_ring_d, outer_ring_d, 0]) {
            cube([10, 70.6 - outer_ring_d*2, 8], center = false);

            translate([70.6 - 10 - outer_ring_d*2, 0, 0])
                cube([10, 70.6 - outer_ring_d*2, 8], center = false);
        }
    }

}

module ring() {
    difference() {
        cube([70.6, 70.6, 5], center = false);

        translate([70.6 / 2, 70.6 / 2, -2])
            cylinder(d = 60.2, h = 8, center = false, $fn = 200);
    }
}

union() {
    difference() {
        union() {
            translate([70.6 / 2 - 35 / 2, 70.6 / 2 - 47 / 2, 4])
                connector();

            distance_holder();

            translate([0, 0, -5])
                ring();
        }

        translate([70.6 / 2, 70.6 / 2, -6])
            cylinder(d = 60.2, h = 8, center = false, $fn = 100);

        translate([76.6 / 2 - 3, 76.6 / 2 - 3, -20]) {
            cylinder(d = 3, h = 50, center = false, $fn = 100);
        }

        translate([76.6 / 2 - 3, 76.6 / 2 - 3, -2.1]) {
            cylinder(d = 5, h = 7.5, center = false, $fn = 100);
        }

        // Cut out opening gap
        translate([70.6 / 2 - 7/2,70.6-3-4,-10])
            cube([7, 3, 20], center = false);
    }

    translate([70.6/2 - 1.7/2,5.1+8,1])
        linear_extrude(height=1)
            rounded_rectangle(1.7, 3.5, 0.5);

}


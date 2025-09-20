use <./parts.scad>

module backplate() {
    difference() {
        linear_extrude(height=6)
            rounded_rectangle(50, 50, 10, fn=100);

        translate([.5,0,0])
        translate([0,50/2-15.5/2,0.1])
        translate([0,0,3.5]) {
            cube([1.8, 15.5, 2.5], center=false);

            translate([47,0,0])
                cube([1.8, 15.5, 2.5], center=false);
        }


        translate([2,12.5,0])
            translate([0,0,3.51]) {
                {
                    cube([5, 2,2.5], center=false);

                    translate([0, 23, 0])
                        cube([5, 2, 2.5], center=false);
                }

                translate([41,0,0])
                    {
                        cube([5, 2,2.5], center=false);

                        translate([0, 23, 0])
                            cube([5, 2, 2.5], center=false);
                    }
            }

        translate([0,-0.01,4])
            cube([50, 10, 5], center=false);

        translate([0,40.01,4])
            cube([50, 10, 5], center=false);

        {
            translate([25,25,-.5]) {
                hexHole(flatToFlatDistance = M2_5(), depth=2.5);
                cylinder(d=3, h=50, center=false, $fn=100);
            }
        }

        translate([25,25,7.5 - 1])
            cube([15, 15, 5], center=true);


        translate([25, 10, 3.51]) {
            rotate([0,0,90])
                cube([10, 20, 5], center=true);

            translate([0,30,0])
                rotate([0,0,90])
                    cube([10, 20, 5], center=true);
        }
    }
}
backplate();
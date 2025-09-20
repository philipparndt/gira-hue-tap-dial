use <./parts.scad>
use <./backplate_v1.scad>

difference() {
    backplate();

    cube([200, 200, 3], center=true);

    translate([25,25,0]) {
        hexHole(flatToFlatDistance = M2_5(), depth=2.5);
        cylinder(d=3, h=60, center=false, $fn=100);
    }
}

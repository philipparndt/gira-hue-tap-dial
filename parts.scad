
Mtolerance = 0.1;
M5size = 7.8;
M2_5size = 4.9;

function M5() = M5size + Mtolerance;

function M2_5() = M2_5size + Mtolerance;

module hexHole(flatToFlatDistance, depth) {
    previewOptimize = 0.1;
    hexagonSide = flatToFlatDistance / (cos(30) * 2);

    translate([0, 0, -previewOptimize]) {
        linear_extrude(height=depth + previewOptimize * 2, center=false) {
            polygon(points=[
                    [hexagonSide, 0],
                    [hexagonSide / 2, sqrt(3) * hexagonSide / 2],
                    [-hexagonSide / 2, sqrt(3) * hexagonSide / 2],
                    [-hexagonSide, 0],
                    [-hexagonSide / 2, -sqrt(3) * hexagonSide / 2],
                    [hexagonSide / 2, -sqrt(3) * hexagonSide / 2]
                ]);
        }
    }
}

// Rounded rectangle module
module rounded_rectangle(width, height, r, fn=64) {
    // ensure radius doesn't exceed half of width/height
    rr = min(r, width/2, height/2);

    translate([rr, rr])
        offset(r=rr, $fn=fn)
            square([width - 2*rr, height - 2*rr]);

}

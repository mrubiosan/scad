outerWidth = 209;
depth = 13;
outerHeight = 110;
// Width of the inner void
innerWidth = 171;
// Height of the inner void
innerHeight = 96;
// For round corners
faceRadius = 10;
// Affects how strong the wall will be
innerWallThickness = 4;
// Save material by having a narrow face.
faceThickness = 4;
// Smoothness of the corners
numFragments = 50;

difference() {
    cube([outerWidth, outerHeight, depth], center = true);
    // Create inner void
    cube([innerWidth, innerHeight, depth], center = true);
    
    // Corner rounding
    for(a = [0, 180]) {
        for(b = [0, 180]) {
            rotate([a, b, 0]) {
                translate([outerWidth / 2 - faceRadius, outerHeight / 2 - faceRadius, 0]) {
                    intersection() {
                        difference() {
                            cube([faceRadius * 2, faceRadius * 2, depth], center = true);
                            cylinder(depth, faceRadius, faceRadius, center = true, $fn = numFragments);
                            
                        }
                        translate([faceRadius / 2, faceRadius / 2, 0]) {
                            cube([faceRadius, faceRadius, depth], center = true);
                        }
                    }

                }
            }
        }
    }

    // Remove material behind the face for savings
    translate([0, 0, faceThickness]) {
        difference() {
            cube([outerWidth, outerHeight, depth], center = true);
            cube([innerWidth + innerWallThickness * 2, innerHeight + innerWallThickness * 2, depth], center = true);
        }
    }
}

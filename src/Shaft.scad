include <Dimensions.scad>
$fn=50;

shaft(0);

module shaft(delta=0){
    cutNotch(delta)
    {
        cylinder(h=shaftLength,d=shaftDiameter+delta*2,center=true);
    }
}

module cutNotch(delta=0){
    notchHeight=3;
    difference()
    {
        children();

        translate([0,0,shaftDiameter/2+shaftLength/2-(capRingHeight-1)+delta])
        union(){
            translate([shaftDiameter/2+notchHeight+delta,0,0])
            cube([shaftDiameter,shaftDiameter,shaftDiameter],center=true);

            translate([-shaftDiameter/2-notchHeight-delta,0,0])
            cube([shaftDiameter,shaftDiameter,shaftDiameter],center=true);
        }
    }
}

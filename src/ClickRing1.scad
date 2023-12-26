include <Dimensions.scad>
include <ClickRingBase.scad>


clickRing1();

module clickRing1(){
    ringWithNotch(0);

    difference()
    {
        union(){
            cylinder(h=clickringHeight,d=axeDiameter+2,center=true);

            for(i=[30:120:389]){
                rotate([0,0,i])
                translate([clickringDiameter/4-clickringThickness/2,0,clickringHeight/2-0.6/2-0.5])
                cube([clickringDiameter/2,7.0,0.6],center=true);
            }
        }
        cylinder(h=clickringHeight+overlap,d=axeDiameter,center=true);
    }
}

module ringWithNotch(delta=0){
    translate([0,0,deltaRinsize/2+notchHeight])
    difference()
    {
        ring(clickringHeight,delta);

        translate([0,0,notchDiameter/2+clickringHeight/2-deltaRinsize/2-notchHeight])
        for(a=[0:60:179]){
            rotate([a,90,0])
            cylinder(h=60,d=notchDiameter,center=true);
        }
    }
}

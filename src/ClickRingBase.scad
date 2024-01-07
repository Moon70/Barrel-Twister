include <Dimensions.scad>


module createClickRingBase(delta=0,height=ringHeight){
    difference()
    {
        cylinder(h=height,d=clickRingOuterDiameter+delta*2,center=true);
        cylinder(h=height+overlap,d=clickRingInnerDiameter+delta*2,center=true);
    }
}
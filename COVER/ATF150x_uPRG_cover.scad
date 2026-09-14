/*
   Cover for ATF150x_uPRG
   Brian K. White - b.kenyon.w@gmail.com
   https://github.com/bkw777/ATF150x_uPRG
*/

pcb_stl = "lib/PCB.stl";

$fn = 36;            // arc smoothness
in = 25.4;
mil = in/1000;

wt = 2;              // wall thickness
min_wall_thickness = 0.8;
fitment_clearance = 0.4;

pcb_w = 1500*mil;    // hat pcb long dim
pcb_d = 900*mil;     // hat pcb short dim
pcb_h = 1.6;         // pcb thickness
pcb_r = 100*mil;     // pcb corner radius

pin_ins_h = 100*mil; // pin header insulator height

interior_major_radius = 100*mil;

// both pcbs and pin header insulator
pcb_stack = pcb_h + pin_ins_h + pcb_h;

// "top" & "bottom" are flipped
// because in the end the bottom of the hat
// is the exposed surface with jumpers and leds.

// top-side components of 2264 (bottom of final assembly)
bottom_components_height = 3;

// bottom-side components of hat (top of final assembly) 
top_components_height = 5;

fc = fitment_clearance;
o = 0.1;             // overcut/overlap/overextend

// top height
th = top_components_height;

// bottom interior height
bih = pcb_stack + bottom_components_height;

// bottom exterior height
beh = bih + fc + wt;

mwt = min_wall_thickness;
ew = pcb_w; //+wt*2; // exterior width
ed = mwt + fc + pcb_d + fc + mwt; // exterior depth
eh = th + beh;       // exterior height
ir = interior_major_radius; // interior radius
ra = ir+wt;          // major radius
rb = wt;             // minor radius

// =============================================================

include <lib/handy.scad>;

module pcb() {
  rotate([180,0,0]) %import(pcb_stl);
}

module simple_cover () {

  difference() {
  
    // add
    hull() {
      // top
      difference() {
        mirror_copy([0,1,0])
          translate([0,ed/2-wt,-ra+th])
            rotate([90,0,0])
              rcube([ew,ra*2,wt*2],rh=ra,rv=rb,t=0);
        // cut bottom half off
        translate([0,0,-eh/2+th-ra])
          cube([ew+2,ed+2,eh],center=true);
      }

      // bottom
      difference(){
        mirror_copy([1,0,0])
          translate([ew/2-wt,0,ra-beh])
            rotate([0,90,0])
              rcube([ra*2,ed,wt*2],rh=ra,rv=rb,t=0);
        // cut top half off
        translate([0,0,eh/2-beh+ra])
          cube([ew+2,ed+2,eh],center=true);        
      }
    }
  
    // remove
    group() {
      // main
      ch = eh+1;
      translate([0,0,ch/2-beh+wt])
        rotate([0,90,0]) rcube([ch,ed-wt*2,ew+2],rh=ir);

      // pcb slot
      translate([0,0,-pcb_stack/2])
        rcube([pcb_w+fc*2,pcb_d+fc*2,pcb_stack+fc*2],rh=pcb_r+fc);
    
    }
  
  }

}

// =============================================================

pcb();

    pr = ($preview) ? 0 : 90;
    pz = ($preview) ? 0 : ew/2;
    px = ($preview) ? 0 : beh-eh/2;    
    translate ([px,0,pz])
      rotate([0,pr,0])
        simple_cover();

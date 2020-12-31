// ARENA DI VERONA - element library
//
// license : Creative Commons BY-NC-SA
//
// (C) Paolo Lombardi @ paladeen.net

// column example with trapezoid and wall
translate([-60,0,0]) color("Goldenrod") trapezoid([2.4,2.4,1],-0.2,-0.2);
translate([-60,0,1]) color("Moccasin")  wall([2,2,7]);
translate([-60,0,8]) color("Goldenrod") trapezoid([2,2,1],0.2,0.2);

// opening, door, window, arch examples
translate([-50,0,0]) opening([6,1,9],3);
translate([-40,0,0]) door([6,1,9],3,5);
translate([-30,0,0]) window([6,1,9],3,3,4);
translate([-20,0,0]) arch([6,1,9],4,6);

// full c6 element
translate([-10,0,0]) {
  c6arch();
  translate([3.05,0,0]) c6column();
  translate([-3.05,0,0]) c6column();
}

#wall([4,2,10]);

// C6 COLUMN
module c6column() {
  // ground floor
  translate([0,0,0])     color("Moccasin")  wall([0.9,2.1,8.1]);
  translate([0,0,7.5])   color("Goldenrod") trapezoid([0.9,2.1,0.6],0.15,0.15);
  // first floor
  translate([0,-0.25,10]) {
    translate([0,0,0])     color("Moccasin")  wall([0.9,1.8,8.1]);
    translate([0,0,7.5])   color("Goldenrod") trapezoid([0.9,1.8,0.6],0.15,0.15);
  }
  // second floor
  translate([0,-0.25,20]) {
    translate([0,0,0])     color("Moccasin")  wall([1.8,0.9,7.1]);
    translate([0,0,6.5])   color("Goldenrod") trapezoid([1.8,0.9,0.6],0.15,0.15);
  }
  // third floor
  translate([0,-0.25,29]) {
    translate([0,0,0])     color("Moccasin")  wall([0.6,0.7,6.55]);
  }
}

// C6 ARCH
module c6arch() {
  // ground floor
  translate([0,0,0])       arch([6.2,1.8,10],3.6,7.1);
  translate([-2.425,0,5])  color("Goldenrod") trapezoid([1.25,1.8,0.3],0.15,0.15);
  translate([2.425,0,5])   color("Goldenrod") trapezoid([1.25,1.8,0.3],0.15,0.15);
  translate([0,0,8.1])     color("Goldenrod") wall([6.2,2.3,0.6]);
  translate([0,0,9.4])     color("Goldenrod") trapezoid([6.2,1.8,0.6],0,0.3);
  // first floor
  translate([0,0,10]) {
    translate([0,0,0])       arch([6.2,1.5,10],3.6,7.1);
    translate([0,0,0])       wall([6.2,1.8,0.9]);
    translate([-2.425,0,5])  color("Goldenrod") trapezoid([1.25,1.5,0.3],0.15,0.15);
    translate([2.425,0,5])   color("Goldenrod") trapezoid([1.25,1.5,0.3],0.15,0.15);
    translate([0,0,8.1])     color("Goldenrod") wall([6.2,2.1,0.6]);
    translate([0,0,9.4])     color("Goldenrod") trapezoid([6.2,1.5,0.6],0,0.3);
  }
  // second floor
  translate([0,-0.15,20]) {
    translate([0,0,0])         arch([6.2,0.45,9],3.3,5.55);
    translate([0,0,0])         arch([6.2,0.9,6.5],4.2,6);
    translate([0,0,0])         wall([6.2,0.8,0.9]);
    translate([-2.275,0,3.3])  color("Goldenrod") trapezoid([1.25,0.45,0.3],0.15,0.15);
    translate([2.275,0,3.3])   color("Goldenrod") trapezoid([1.25,0.45,0.3],0.15,0.15);
    translate([0,0,6.5])       wall([6.2,0.6,1.9]);
    translate([0,0,8.4])       color("Goldenrod") trapezoid([6.2,0.6,0.6],0,0.3);
  }
  // third floor
  translate([0,-0.15,29]) {
    translate([0,0,0])     window([6.2,0.6,7.75],2.6,1.8,2.6);
    translate([0,0,6.55])  color("Goldenrod") trapezoid([6.2,0.7,0.6],0,0.15);
  }
}


// WALL (rectangular wall or column)
// ss : vector for envelope cube
module wall(ss) { 
  translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
}

// TRAPEZOID (trapezoidal wall or column)
// ss : vector for envelope cube
// dx : displacement in X
// dx : displacement in Y
module trapezoid(ss,dx,dy) {
  points = [
    [-ss.x/2,-ss.y/2,0],[ss.x/2,-ss.y/2,0],[ss.x/2,ss.y/2,0],[-ss.x/2,ss.y/2,0],
    [-ss.x/2-dx,-ss.y/2-dy,ss.z],[ss.x/2+dx,-ss.y/2-dy,ss.z],
    [ss.x/2+dx,ss.y/2+dy,ss.z],[-ss.x/2-dx,ss.y/2+dy,ss.z]];
  faces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left
  polyhedron(points,faces);
}

// WINDOW (wall with horizontally centered window)
// ss : vector for envelope cube
// oo : window width
// h1 : height of bottom of window
// h2 : height of top of window
module window(ss,oo,h1,h2) { 
  if (ss.x>ss.y) difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-oo/2,-(ss.y*1.1)/2,h1]) cube([oo,ss.y*1.1,h2]);
  }
  else difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-(ss.x*1.1)/2,-oo/2,h1]) cube([ss.x*1.1,oo,h2]);
  }
}


// DOOR (wall with horizontally centered rect opening)
// ss : vector for envelope cube
// oo : door width
// hh : height of door
module door(ss,oo,hh) {
  if (ss.x>ss.y) difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-oo/2,-(ss.y*1.1)/2,-hh*0.1]) cube([oo,ss.y*1.1,hh*1.1]);
  }
  else difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-(ss.x*1.1)/2,-oo/2,-hh*0.1]) cube([ss.x*1.1,oo,hh*1.1]);
  }
}


// OPENING (wall horizontally centered with void opening)
// ss : vector for envelope cube
// oo : opening width
module opening(ss,oo) {
  if (ss.x>ss.y) difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-oo/2,-(ss.y*1.1)/2,-(ss.z*0.1)/2]) cube([oo,ss.y*1.1,ss.z*1.1]);
  }
  else difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-(ss.x*1.1)/2,-oo/2,-(ss.z*0.1)/2]) cube([ss.x*1.1,oo,ss.z*1.1]);
  }
}

// ARCH (wall with arched opening)
// ss : vector for envelope cube
// oo : width of opening and arch diameter
// hh : height of opening including arch
module arch(ss,oo,hh) {
  ho = hh-oo/2;
  if (ss.x>ss.y) difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-oo/2,-(ss.y*1.1)/2,-ho*0.1]) cube([oo,ss.y*1.1,ho*1.1]);
    translate([0,-(ss.y*1.1)/2,ho]) rotate([-90,0,0]) cylinder(d=oo,h=ss.y*1.1,$fs=0.2);
  }
  else difference() {
    translate([-ss.x/2,-ss.y/2,0]) cube([ss.x,ss.y,ss.z]);
    translate([-(ss.x*1.1)/2,-oo/2,-ho*0.1]) cube([ss.x*1.1,oo,ho*1.1]);
    translate([-(ss.x*1.1)/2,0,ho]) rotate([0,90,0]) cylinder(d=oo,h=ss.x*1.1,$fs=0.2);
  }  
}


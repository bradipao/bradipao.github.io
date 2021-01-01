# Verona Arena
### 3 - Raising the outermost ring

The procedural building of the model seen in the previous two pages seems a bit overkill for a simple bi-dimensional plan, but it start becoming handy not to raise the walls. We already have a building procedure that place elements on the plan, we need just to draw the individual architectural elements and let the procedure place them.

#### Architectural elements

Before to start it is important to explain a detail of the elements drawing: each element will be drawn in a local coordinate system that will make easier its placement, in particular we will use a coordinate system with origin of axis at the center of the base of the element.

![Verona Arena element coordinates](img-arena/arena_elements_coord.png)

The reason is quite clear with the example of a column, whose base is centerd on the origin of axis and grows toward positive direction of Z. The procedural bulding developed for the plan locates the X,Y coordinates where to place the column, that in turn will be autonomous to grow in height according to its model. Another local coordinate system would have made positioning dependent on size of element.

Here below a few basic architectural element (and relevant openscad code at the bottom of page), created to have a glance of the outermost ring. Each element is drawn according to the above local coordinate system, compatible with the procedural building method and parametric, so that can be later optimized and enhanced without need to intervene on the overall model.

- WALL : simple parametric wall
- TRAPEZOID : trapezoidal wall, mainly used as capital of column
- OPENING : wall with full height opening
- DOOR : wall with rectangular door opening
- WINDOW : wall with rectangular window opening
- ARCH : wall with arch opening

![Verona Arena elements](img-arena/arena_elements.png)


#### Raising the ring

Now that we have walls, columns and arches, we need to combine them in the external face of one of the 72 wedges that compose the oval. Thanks to the high number of wedges, we can approximate its face in a planar way (straight line on the plan) without losing aesthetics.

Each wedge is composed by four floors, the first three are arches, the fourth is supposed to be a simple window (no fourth floor has survived in Verona Arena, but Coliseum can be taken as reference). At the left and right border of wedge there would be columns and capitals, but being on the joining line, there would be artifacts, so we do not include them in this element. Columns and capitals will be directly placed in place using the procedural building, with the convenient collateral effect to cover the joining point of the wedges.

Once decided the approach, we collect the necessary sizes:
- horizontal size of face of wedge is given by the procedural building method
- heights and horizontal sizes of details (columns, openings, arches) are taken from photos and diagrams of the existing four wedges of sixth ring
- depths are much less important and can be estimated from photos and plans
- note: apart from a few main sizes, the other can be literally tried and tuned on the model, in order to achieve a visual effect similar to actual photos

At end we have two main architectural elements, which need only to be repeated 72 times in position given by the procedural building method. These are quite rough, but they are detailed enough to have a glance and can be easily enhanced later without need to intervene on overall model.
- C6ARCH : face of wedge element of sixth ring
- C6COLUMN : column of sizth ring

![Verona Arena C6 element](img-arena/arena_c6_element.png)


Now let's put all together and see how the whole sixth ring appears.

![Verona Arena C6 oval](img-arena/arena_c6_full.png)



```openscad
// VERONA ARENA - element library

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
```

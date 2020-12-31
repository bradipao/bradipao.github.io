
// parameters for 4-circles oval
alfa = 58.95;
beta = 90-alfa;
rmin = 561;
rmax = 953;
dxmin = (rmax-rmin)*cos(alfa);
dymax = (rmax-rmin)*sin(alfa);

// RMAX circles
for (ii=[-8:8]) {
  
  // 17 small arches
  px = (rmax)*cos(2*beta*ii/17-90);
  py = (rmax)*sin(2*beta*ii/17-90);
  translate([px,py+dymax,0]) rotate([0,0,2*beta*ii/17])   arch(xx=62,yy=10,zz=80);
  translate([px,-py-dymax,0]) rotate([0,0,-2*beta*ii/17]) arch(xx=62,yy=10,zz=80);
  
  // 17 circular sectors
  pxA = (rmax)*cos(2*beta*(ii-0.4)/17-90);
  pyA = (rmax)*sin(2*beta*(ii-0.4)/17-90);
  pxB = (rmax)*cos(2*beta*(ii+0.4)/17-90);
  pyB = (rmax)*sin(2*beta*(ii+0.4)/17-90);
  a = [[0,dymax],[pxA,pyA+dymax],[pxB,pyB+dymax]];
  color("MistyRose") polygon(a);
}

// RMIN circles
for (ii=[-9:9]) {
  
  // 19 small arches
  c = ((ii%2)==0) ? "blue" : "gold";
  px = (rmin)*cos(2*alfa*ii/19);
  py = (rmin)*sin(2*alfa*ii/19);
  translate([px+dxmin,py,0]) rotate([0,0,2*alfa*ii/19+90])  arch(xx=62,yy=10,zz=80);
  translate([-px-dxmin,py,0]) rotate([0,0,-2*alfa*ii/19+90]) arch(xx=62,yy=10,zz=80);

  // 19 circular sectors
  pxA = (rmin)*cos(2*alfa*(ii-0.4)/19);
  pyA = (rmin)*sin(2*alfa*(ii-0.4)/19);
  pxB = (rmin)*cos(2*alfa*(ii+0.4)/19);
  pyB = (rmin)*sin(2*alfa*(ii+0.4)/19);
  a = [[dxmin,0],[dxmin+pxA,pyA],[dxmin+pxB,pyB]];
  b = [[-dxmin,0],[-dxmin-pxA,pyA],[-dxmin-pxB,pyB]];
  color("PowderBlue") polygon(a);
  color("PowderBlue") polygon(b);
}

// small arch module
module arch(xx,yy,zz) { 
  difference() {
    translate([-xx/2,-yy/2,0]) cube([xx,yy,zz]);
    translate([0,0,zz/2]) rotate([90,0,0]) translate([0,0,-yy/2-5]) cylinder(d=xx-10,h=yy+10);
    translate([-(xx-10)/2,-yy,-5]) cube([xx-10,2*yy,zz/2+5]);
  }
}

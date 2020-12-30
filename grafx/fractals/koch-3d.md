# 3D Koch Fractal

### Basics on Koch curve

Koch curve is a mono-dimensional fractal that can be made tri-dimensional with an approach similar to the one followed for Sierpinski fractal. Koch curve is called also snowflake fractal because of its shape.

![Koch 1D](img/koch_1D.png)

This fractal is said mono-dimensional because it is composed solely by lines, even if placed in a bi-dimensional space. The (obviously recursive) procedure to generate a Koch curve is simple:

1. For each segment in the space:
   1. Divide segment in three equal sub-segments
   2. eplace the central sub-segment with two sub-segments, identical to removed one, placed as a triangle
2. Repeat step 1 until number of iterations reached

The final result, at different numbers of iteratios, is shown in the figure below (from Wikipedia).

---

### Koch 2D with openSCAD

Prima di passare ad una versione tridimensionale della curva di Koch, conviene passare dalla sue estensione bidimensionale. A questo scopo si sostituiscono i segmenti monodimensionali con poligoni bidimensionali, nel nostro caso dei triangoli. Partiamo quindi da un triangolo isoscele e lo sostituiamo con due triangoli isosceli, con base di dimensione pari al lato obliquo della figura originaria.

La chiave di queste trasformazioni è che i due triangoli sostitutivi vanno a occupare lo stesso identico perimetro del triangolo originario, lasciando vuoto lo spicchio che darà la forma caratteristica al frattale. Ripetendo ricorsivamente la procedura ci accorgiamo che il frattale generato assomiglia sempre di più a quello monodimensionale. E questo non deve stupire, perché l’aspetto di un frattale è indipendente dalla figura di partenza, dipende esclusivamente dalle trasformazioni geometriche che vengono utilizzate.

![Koch 2D](img/koch_2D.png)

---

### Koch 3D with openSCAD

Passare alla versione tridimensionale della curva di Koch non è così intuitivo come lo era stato per Sierpinski, principalmente perché non possiamo usare una piramide come solido di partenza, anche se a prima vista sembrerebbe logico. Per ottenere l’analogo della trasformazione di Koch in tre dimensioni ci fa più gioco un solido composto da due piramidi isosceli una appoggiata sulla base dell’altra.

Non solo le due piramidi devono essere isosceli, ma anche con precise proporzioni, perché quello che vogliamo è una trasformazione nello spazio che porti un certo numero di queste doppie piramidi ad occupare lo stesso volume esatto della piramide iniziale, lasciando vuoto lo spicchio caratteristico della curva di Koch.

![Koch 3D basic](img/koch_3D_basic.png)

La figura sottostante (che evidenzia il triangolo delle basi e l’asse verticale, senza mostrare le pareti oblique) cerca di far comprendere le trasformazioni spaziali utilizzate: la doppia piramide iniziale è sostituita con tre doppie piramidi, un cui lato della base viene posizionato al posto dell’asse verticale di quella originaria.

![Koch 3D structure](img/koch_3D_structure.png)

Si può notare come l’altezza delle due piramidi, creando un lato obliquo inferiore a quello della base, fa si che si crei uno spicchio vuoto tridimensionale, quello che ci serve per generare l’effetto Koch in 3 dimensioni. Applicando ricorsivamente le trasformazioni, si ottiene il frattale di Koch in 3D, di cui sotto vediamo una versione a 6 livelli di ricorsione.

![Koch 3D](img/koch_3D.png)

---

### Show me the code

```openscad
translate([0,-200,0]) koch2D(100,1,1);
translate([120,-200,0]) koch2D(100,1,2);
translate([0,-250,0]) koch2D(100,1,3);
translate([120,-250,0]) koch2D(100,1,4);
translate([0,-300,0]) koch2D(100,1,5);
translate([120,-300,0]) koch2D(100,1,6);
translate([0,-350,0]) koch2D(100,1,7);
translate([120,-350,0]) koch2D(100,1,8);

translate([-360,0,0]) koch3D(100,1,1);
translate([-240,0,0]) koch3D(100,1,2);
translate([-360,-120,0]) koch3D(100,1,3);
translate([-240,-120,0]) koch3D(100,1,4);
koch3D(100,1,6);

translate([200,0,0]) rotate([0,0,180]) koch3D_structure(100,1,1);
translate([320,0,0]) rotate([0,0,180]) koch3D_structure(100,1,2);

// koch 3D fractal
module koch3D(ww,nn,mm) {
  if (nn<mm) {
    rotate([0,0,120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    rotate([0,0,-120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    rotate([0,0,0])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    
  } else {
    tetrion(ww);
  }
}

// double pyramid
module tetrion(ww) {
  pp = [[-ww/2,-ww/(2*sqrt(3)),0],
        [ww/2,-ww/(2*sqrt(3)),0],
        [0,ww*(sqrt(3)/2 - 1/(2*sqrt(3))),0],
        [0,0,ww/3],
        [0,0,-ww/3]];
  ff = [[3,1,0],
        [3,2,1],
        [3,0,2],
        [0,1,4],
        [1,2,4],
        [2,0,4]];
  polyhedron(pp,ff);
}


// koch 3D fractal structure
module koch3D_structure(ww,nn,mm) {
  if (nn<mm) {
    rotate([0,0,120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    rotate([0,0,-120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    rotate([0,0,0])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    
  } else {
    tetrion_structure(ww);
  }
}

// double pyramid structure
module tetrion_structure(ww) {
  pp = [[-ww/2,-ww/(2*sqrt(3)),0],
        [ww/2,-ww/(2*sqrt(3)),0],
        [0,ww*(sqrt(3)/2 - 1/(2*sqrt(3))),0],
        [0,0,ww/30],
        [0,0,-ww/30]];
  ff = [[3,1,0],
        [3,2,1],
        [3,0,2],
        [0,1,4],
        [1,2,4],
        [2,0,4]];
  polyhedron(pp,ff);
  translate([0,0,-ww/3]) cylinder(d=ww/30,h=2*ww/3);
}


// koch 2D fractal
module koch2D(ww,nn,mm) {
  if (nn<mm) {
    translate([((ww/sqrt(3))*(sqrt(3)/2-1/sqrt(3))),0,0])
      rotate([0,0,150])
        translate([0,-ww/(3*2),0])
          koch2D(ww/sqrt(3),nn+1,mm);
    translate([-((ww/sqrt(3))*(sqrt(3)/2-1/sqrt(3))),0,0])
      rotate([0,0,-150])
        translate([0,-ww/(3*2),0])
          koch2D(ww/sqrt(3),nn+1,mm);
  } else {
    tria(ww);
  }
}

// triangle
module tria(ww) {
  pp = [[-ww/2,0],[ww/2,0],[0,ww/(2*sqrt(3))]];
  polygon(pp);
}
```

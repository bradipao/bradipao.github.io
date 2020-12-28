# 3D Koch Fractal

### Basics on Koch curve

In modo del tutto analogo a quanto fatto per realizzare il Frattale di Sierpinski in 3D, proviamo adesso a rendere tridimensionale la Curva di Koch, uno dei primi frattali mai concepiti (si parla degli inizi del 1900), chiamato anche fiocco di neve di Koch per la figura che si ottiene disponendo a triangolo tre curve elementari di Koch.
IMG

Si tratta di un frattale monodimensionale, nel senso che opera esclusivamente con linee, seppur disposte in uno spazio bidimensionale. La procedura (ovviamente ricorsiva) per la sua generazione è molto semplice:  si parte da un segmento, si divide in tre parti uguali e si sostituisce la parte centrale con due segmenti disposti a triangolo, ciascuno di lunghezza pari a quello rimosso (vedi figura tratta da Wikipedia).


### Koch 2D with openSCAD

Prima di passare ad una versione tridimensionale della curva di Koch, conviene passare dalla sue estensione bidimensionale. A questo scopo si sostituiscono i segmenti monodimensionali con poligoni bidimensionali, nel nostro caso dei triangoli. Partiamo quindi da un triangolo isoscele e lo sostituiamo con due triangoli isosceli, con base di dimensione pari al lato obliquo della figura originaria.

La chiave di queste trasformazioni è che i due triangoli sostitutivi vanno a occupare lo stesso identico perimetro del triangolo originario, lasciando vuoto lo spicchio che darà la forma caratteristica al frattale. Ripetendo ricorsivamente la procedura ci accorgiamo che il frattale generato assomiglia sempre di più a quello monodimensionale. E questo non deve stupire, perché l’aspetto di un frattale è indipendente dalla figura di partenza, dipende esclusivamente dalle trasformazioni geometriche che vengono utilizzate.

IMG
 

### Koch 3D with openSCAD


Passare alla versione tridimensionale della curva di Koch non è così intuitivo come lo era stato per Sierpinski, principalmente perché non possiamo usare una piramide come solido di partenza, anche se a prima vista sembrerebbe logico. Per ottenere l’analogo della trasformazione di Koch in tre dimensioni ci fa più gioco un solido composto da due piramidi isosceli una appoggiata sulla base dell’altra.

Non solo le due piramidi devono essere isosceli, ma anche con precise proporzioni, perché quello che vogliamo è una trasformazione nello spazio che porti un certo numero di queste doppie piramidi ad occupare lo stesso volume esatto della piramide iniziale, lasciando vuoto lo spicchio caratteristico della curva di Koch.

IMG

La figura sottostante (che evidenzia il triangolo delle basi e l’asse verticale, senza mostrare le pareti oblique) cerca di far comprendere le trasformazioni spaziali utilizzate: la doppia piramide iniziale è sostituita con tre doppie piramidi, un cui lato della base viene posizionato al posto dell’asse verticale di quella originaria.

IMG

Si può notare come l’altezza delle due piramidi, creando un lato obliquo inferiore a quello della base, fa si che si crei uno spicchio vuoto tridimensionale, quello che ci serve per generare l’effetto Koch in 3 dimensioni. Applicando ricorsivamente le trasformazioni, si ottiene il frattale di Koch in 3D, di cui sotto vediamo una versione a 6 livelli di ricorsione.

IMG


### Show me the code

Link al codice sorgente

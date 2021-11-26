package parcial4;

/*
Queremos representar libros electrónicos e impresos. De cualquier libro se conoce:
titulo, precio base y el nombre de los autores (a lo sumo 8). Adicionalmente: los
libros electrónicos tienen el formato (ej: ".pdf", ".epub") y su tamaño en MB;
mientras que los libros impresos registran si es tapa dura o no.

Implemente las clases de modelo con sus atributos y getters/setter adecuados.
Provea constructores para iniciar los libros a partir de toda su información y
sin autores.

Agregue a las clases implementadas los metodos necesarios para incorporar la siguiente
funcionalidad:
- Agregar al libro un autor cuyo nombre se recibe. Asuma que hay espacio.
- Obtener el precio final del libro teniendo en cuenta que:
    * Para los lirbos electrónicos el precio base al que se adiciona un impuesto de 
    descarga de 2,5$ por MB
    * Para los libros impresos es el precio base al que se adiciona 500$ si es de tapa
    dura.
- Obtener la representacion String del libro, la cual se compone del titulo, precio
final y nombre de sus autores

2) Realice un programa que instancie un libro electrónico y un libro impreso. Cargue
3 autores a cada uno. Para finalizar, muestre la representacion String de los libros.

*/

public class Programa {
    public static void main(String[] args) {
        Autor a1 = new Autor("Gilles Deleuze");
        Autor a2 = new Autor("Baruch Spinoza");
        Autor a3 = new Autor("Felix Guattari");
        Autor a4 = new Autor("Ursula K. Le Guin");
        Autor a5 = new Autor("Octavia E. Butler");
        Autor a6 = new Autor("Donna Haraway");
        
        LibroImpreso libroImp = new LibroImpreso("Ciencia Ficción y otros textos", 1000, true);
        LibroElectronico libroEle = new LibroElectronico("Bla bla bla", 1200, 5, ".mobi");
        
        libroImp.agregarAutor(a6);
        libroImp.agregarAutor(a5);
        libroImp.agregarAutor(a4);
        
        libroEle.agregarAutor(a1);
        libroEle.agregarAutor(a2);
        libroEle.agregarAutor(a3);

        System.out.println(libroImp.toString());
        System.out.println(libroEle.toString());
    }
}

package oop.oop4.examples.statics;

public class App {
    public static void main(String[] args) {
        Car bmw = new Car("BMW", "X6", 290);
        Car mercedes = new Car("Merceds", "McLaren", 280);
        Car porshe = new Car("Porshe", "Carrera", 320);

        System.out.println(Car.getLimitSpeed());
        // System.out.println(porshe.getLimitSpeed()); STATIC not works here.
        Car.setLimitSpeed(240);

        System.out.println(bmw);;
        System.out.println(mercedes);;
        System.out.println(porshe.toString());
    }
}

package oop.oop4.exercises.n3;

public class App {
    public static void main(String[] args) {
        System.out.println("Areas da Geometria\n----------------------------");
        System.out.println(Geometry.squareAreA(4));
        System.out.println(Geometry.rectangleArea(2, 3));
        System.out.println(Geometry.triangleArea(5, 5));
        System.out.printf("%.2f\n", Geometry.cubeArea(30));
        System.out.println(Geometry.cuboidArea(2, 2, 5));
        System.out.println(Geometry.trapezoidArea(2, 2, 2));
        System.out.println("----------------------------");
    }
}

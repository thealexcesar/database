package oop.oop4.exercises.n3;
/**
 * Create a Geometry class with static methods for calculating
 * the area of: square, rectangle, triangle, circle, cube, cuboid, trapezoid,
 * and sphere. Each method should return the result of the corresponding operation.
 * @author Alex Cesar
 */
public class Geometry {

    public static double squareAreA(double a) {
        System.out.print("Area do quadrado: ");
        return a * a;
    }

    public static double rectangleArea(double length, double width) {
        System.out.print("Area do retângulo: ");
        return length * width;
    }

    public static double triangleArea(double base, double height) {
        System.out.print("Area do triângulo: ");
        return (base * height) * 0.5;
    }

    public static double cubeArea(double radius) {
        System.out.print("Area do cubo: ");
        return Math.PI * radius * radius;
    }

    public static double cuboidArea(double length, double width, double height) {
        System.out.print("Area do cubóide: ");
        return length * width * height;
    }

    public static double trapezoidArea(double base1, double base2, double height) {
        System.out.print("Area do trapezóide: ");
        return (base1 * base1) * height / 2;
    }
}

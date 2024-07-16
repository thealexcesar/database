package oop.oop4.examples.statics;

public class Car {
    private String brand;
    private String model;
    private int maxSpeed=120;
    private static int LIMIT_SPEED=250; // Uppercase because it was constant.

    static {
        System.out.println("Before Initialization BLock");
        // System.out.println(maxSpeed); // Static cannot access non-static
    }

    {
        System.out.println(maxSpeed);
        System.out.println("Before Constructor");
    }

    public Car(String brand, String model, double maxSpeed) {
        this.brand = brand;
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public static int getLimitSpeed() {
        return LIMIT_SPEED;
    }

    public static void setLimitSpeed(int limitSpeed) {
        LIMIT_SPEED = limitSpeed;
    }

    @Override
    public String toString() {
        return String.format("\n'%s':\n\u001B[31m{\u001B[0m\n\t'brand': '%s',\n\t'model': " +
                        "'%s', \n\t'maxSpeed': %d, \n\t'LimitSpeed': %d\n\u001B[31m}\u001B[0m",
                brand.toLowerCase(), brand, model, maxSpeed, LIMIT_SPEED);
    }
}

package oop.oop1.examples.methods;

public class App {
    public static void main(String[] args) {

        /* Calculator ----------------------------------------------- */
        Calculator calculator = new Calculator();
        int[] array = {1, 2, 3, 4, 5};

        // calculator.sumArray(array);
        calculator.sumArrayUsingVarArgs("Using Var Args\n",array);

        /* Employee ------------------------------------------------- */
        Employee employee = new Employee();
        employee.setName("Goku");
        employee.setSalaries(new double[] {1200, 987.32, 2000});

        System.out.println(employee.toString());
    }
}

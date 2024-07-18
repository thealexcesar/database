package advanced_java.generics.exercises.employee;

import advanced_java.generics.exercises.employee.domain.*;

public class App {
    public static void main(String[] args) {
        GenericEntity<Manager> managers = new GenericEntity<>();
        GenericEntity<Engineer> engineers = new GenericEntity<>();
        GenericEntity<Intern> interns = new GenericEntity<>();

        Manager manager = new Manager("Mario", 35, 15000);
        Engineer engineer = new Engineer("Dante", 32, Speciality.SOFTWARE);
        Intern intern = new Intern("Link", 20, "Harvard University");

        managers.addEntity(manager);
        engineers.addEntity(engineer);
        interns.addEntity(intern);

        System.out.println("Detalhes dos Managers:");
        managers.printEntityDetails();

        System.out.println("\nDetalhes dos Engineers:");
        engineers.printEntityDetails();

        System.out.println("\nDetalhes dos Interns:");
        interns.printEntityDetails();
    }
}

package oop.oop3.exercises.cellphone;

import java.util.ArrayList;
import java.util.Scanner;
/**
 * Create a class called CellPhone to model information about a cellphone.
 * Attributes: Brand, Model, Storage, Installed Apps.
 * Methods: installApp and displayInformation.
 * @author Alex
 * */
class CellPhone {
    private String brand;
    private String model;
    private int storage;
    private ArrayList<String> installedApps;

    public CellPhone(String brand, String model, int storage) {
        this.brand = brand;
        this.model = model;
        this.storage = storage;
        this.installedApps = new ArrayList<>();
    }

    public void installApp(String appName) {
        installedApps.add(appName);
        System.out.println("\u001B[32mAplicativo " + appName + " instalado com sucesso.\u001B[0m");
        System.out.println("-------------------------------");
    }

    public void displayInformation() {
        System.out.println("Marca: " + brand);
        System.out.println("Modelo: " + model);
        System.out.println("Armazenamento: " + storage + "GB");
        System.out.println("Aplicativos instalados: " + installedApps);
        System.out.println("-------------------------------");
    }

    public static CellPhone createCellPhone(Scanner input) {
        System.out.print("Digite a marca: ");
        String brand = input.nextLine();
        System.out.print("Digite o modelo: ");
        String model = input.nextLine();
        int storage = getValidInt(input, "Digite o armazenamento (em GB): ");
        return new CellPhone(brand, model, storage);
    }

    public static void addCellPhone(Scanner input, ArrayList<CellPhone> cellPhoneList) {
        cellPhoneList.add(createCellPhone(input));
        System.out.println("\u001B[32mCelular registrado com sucesso.\u001B[0m");
        System.out.println("-------------------------------");
    }

    public static void listCellPhones(ArrayList<CellPhone> cellPhoneList) {
        if (cellPhoneList.isEmpty()) {
            System.out.println("\n\u001B[34mNenhum celular registrado.\u001B[0m");
            System.out.println("-------------------------------");
        } else {
            System.out.println("\n\u001B[34mLista de Celulares:\u001B[0m");
            System.out.println("-------------------------------");
            for (CellPhone cellPhone : cellPhoneList) {
                cellPhone.displayInformation();
            }
        }
    }

    private static int getValidInt(Scanner input, String message) {
        int value;
        while (true) {
            try {
                System.out.print(message);
                value = Integer.parseInt(input.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.err.print("Entrada inválida. Por favor, digite um número inteiro: ");
            }
        }
        return value;
    }

    public static void installAppOnPhone(Scanner input, ArrayList<CellPhone> cellPhoneList) {
        System.out.print("Digite o modelo do celular: ");
        String model = input.nextLine();
        CellPhone cellPhone = findCellPhone(model, cellPhoneList);
        if (cellPhone != null) {
            System.out.print("Digite o nome do aplicativo a ser instalado: ");
            String appName = input.nextLine();
            cellPhone.installApp(appName);
        } else {
            System.out.println("-------------------------------");
            System.err.println("Celular não encontrado.");
            System.out.println("-------------------------------");
        }
    }

    private static CellPhone findCellPhone(String model, ArrayList<CellPhone> cellPhoneList) {
        for (CellPhone cellPhone : cellPhoneList) {
            if (cellPhone.model.equalsIgnoreCase(model)) {
                return cellPhone;
            }
        }
        return null;
    }
}
package oop.oop4.exercises.n8;

public class App {

    public static void main(String[] args) {
        int[] array = { 37, 2024, 43, 12, 5, 9, 1, 2, 10, 100, 300, 40 };

        Sortable bubbleSort = new BubbleSort();
        System.out.println("\u001B[34mBOBBLE SORT\n\u001B[0m-----------------------------------------------");
        System.out.print("Antes: ");
        for (int i = 0; i < array.length; i++) {
            System.out.print(""+array[i]);
            System.out.print(", ");
        }
        bubbleSort.sort(array);
        System.out.print("\nOrdenado: ");
        printArray(array);

        int[] array2 = { 17, 13, 8, 4, 44, 14 };
        System.out.println("\n\u001B[34mQUICK SORT\n\u001B[0m-----------------------------------------------");
        System.out.print("Antes: ");
        for (int i = 0; i < array2.length; i++) {
            System.out.print(""+array2[i]);
            System.out.print(", ");
        }
        Sortable quickSort = new QuickSort();
        quickSort.sort(array2);
        System.out.print("\nOrdenado: ");
        printArray(array2);
    }

    private static void printArray(int[] array) {
        for (int value : array) {
            System.out.print(value + ", ");
        }
        System.out.println();
    }
}

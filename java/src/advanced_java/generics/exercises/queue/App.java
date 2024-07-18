package advanced_java.generics.exercises.queue;

public class App {
    public static void main(String[] args) {
        GenericQueue<String> queueStr = new GenericQueue<>();
        GenericQueue<Integer> queueInt = new GenericQueue<>();

        queueStr.enqueue("A");
        queueStr.enqueue("B");
        queueStr.enqueue("C");
        System.out.println(queueStr);

        queueInt.enqueue(1);
        queueInt.enqueue(2);
        System.out.println(queueInt);

        System.out.println("Fila vazia? " + queueStr.isEmpty());
        System.out.println("Proximo: " + queueInt.peek());

        System.out.println("Desenfileirando: " + queueStr.dequeue());
        System.out.println("Desenfileirando: " + queueStr.dequeue());
        System.out.println("Desenfileirando: " + queueStr.dequeue());

        System.out.println("Vazio? " + queueStr.isEmpty());

        try {
            queueInt.dequeue();
            System.out.println(queueInt);
        } catch (Exception e) {
            System.err.println("Erro: " + e.getMessage());
        }
    }
}

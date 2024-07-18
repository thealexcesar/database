package advanced_java.generics.exercises.queue;

import java.util.LinkedList;
import java.util.NoSuchElementException;

public class GenericQueue<T> {
    private LinkedList<T> queue;

    public GenericQueue() {
        this.queue = new LinkedList<>();
    }

    public void enqueue(T item) {
        queue.addLast(item);
    }

    public T peek() {
        emptyException();
        return queue.peekFirst();
    }

    public T dequeue() {
        emptyException();
        return queue.removeFirst();
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }

    private void emptyException() {
        if (queue.isEmpty()) throw new NoSuchElementException("A fila já está vazia.");
    }

    @Override
    public String toString() {
        return "GenericQueue{" +
                "queue=" + queue +
                '}';
    }
}

package advanced_java.netflix.ui.utils;

public class PrintMsg {
    public static void tryAgain(String invalidAction) {
        System.out.printf("\u001B[31m%s Tente novamente.\n\u001B[0m", invalidAction);
    }

    public static void actions(boolean found, String content) {
        System.out.printf(found ? "%s com sucesso.\n" : "\u001B[31m%s não encontrado.\n\u001B[0m", content);
    }

    public static void actions(boolean found) {
        System.out.println(found ? "sucesso." : "\u001B[31mConteúdo não encontrado.\u001B[0m"); // FIXME!!!!
    }

    public static void choose(String content) {
        System.out.print("Escolha um(a)"+content+": ");
    }
}

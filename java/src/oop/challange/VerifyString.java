package oop.challange;

public class VerifyString {
    public static void main(String[] args) {
        System.err.println(compareFirstCharsOfTwoStrings("ab", "a"));
        System.err.println(compareFirstCharsOfTwoStrings("caab", "abcd"));
        System.err.println(compareFirstCharsOfTwoStrings("abcd", "abcd"));
        System.out.println(compareFirstCharsOfTwoStrings("cdab", "abcd"));
    }

    private static boolean compareFirstCharsOfTwoStrings(String a, String b) {
        if (a.length() <= 2 && b.length() <= 2) {
            return false;
        }
        String firstOfA = a.substring(0, 2);
        String lastOfB = b.substring(b.length() -2);

        return firstOfA.equals(lastOfB);
    }
}

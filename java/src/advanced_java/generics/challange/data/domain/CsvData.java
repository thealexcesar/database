package advanced_java.generics.challange.data.domain;

import java.util.Arrays;

public class CsvData {
    private final String[] fields;

    public CsvData(String[] fields) {
        this.fields = fields;
    }

    public String[] getFields() {
        return fields;
    }

    @Override
    public String toString() {
        return "Campos: " + Arrays.toString(fields);
    }
}

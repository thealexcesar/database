package advanced_java.netflix.repository;

import advanced_java.netflix.domain.Documentary;
import advanced_java.netflix.domain.GenreType;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DocumentariesRepository implements Repository<Documentary> {
    private List<Documentary> documentaries = new ArrayList<>();

    public DocumentariesRepository() {
        loadSampleData();
    }

    @Override
    public List<Documentary> findAll() {
        return new ArrayList<>(documentaries);
    }

    private void loadSampleData() {
        documentaries.add(new Documentary("Planet Earth", GenreType.DOCUMENTARY, LocalDate.of(2006, 3, 5)));
        documentaries.add(new Documentary("The Last Dance", GenreType.DOCUMENTARY, LocalDate.of(2020, 4, 19)));
        documentaries.add(new Documentary("Making a Murderer", GenreType.DOCUMENTARY, LocalDate.of(2015, 12, 18)));
        documentaries.add(new Documentary("Tiger King", GenreType.DOCUMENTARY, LocalDate.of(2020, 3, 20)));
        documentaries.add(new Documentary("The Social Dilemma", GenreType.DOCUMENTARY, LocalDate.of(2020, 1, 26)));
    }
}
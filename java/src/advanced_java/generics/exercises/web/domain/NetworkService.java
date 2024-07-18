package advanced_java.generics.exercises.web.domain;

import java.util.ArrayList;
import java.util.List;

public class NetworkService {
    private final List<Network> networks = new ArrayList<>();

    public void addNetwork(Network network) {
        networks.add(network);
    }

    public void removeNetwork(Network network) {
        networks.remove(network);
    }

    public void simulate() {
        networks.forEach(Network::operate);
    }
}

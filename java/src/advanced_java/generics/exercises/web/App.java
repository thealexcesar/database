package advanced_java.generics.exercises.web;

import advanced_java.generics.exercises.web.domain.*;

public class App {
    public static void main(String[] args) {
        NetworkService simulator = new NetworkService();

        Network pan = new PAN("Rede Pessoal em Casa no Garcia");
        Network lan = new LAN("Rede Local no Escritório T-Systems");
        Network man = new MAN("Rede Metropolitana na Cidade de Blumenau");
        Network wan = new WAN("Rede de Longa Distância Global");

        pan.addComponent(new Router("Roteador 1"));
        pan.addComponent(new WirelessAccessPoint("Ponto de Acesso 1"));

        lan.addComponent(new Router("Roteador 2"));
        lan.addComponent(new Switch("Switch 1"));

        man.addComponent(new Router("Roteador 3"));
        man.addComponent(new Switch("Switch 2"));

        wan.addComponent(new Router("Roteador 4"));

        simulator.addNetwork(pan);
        simulator.addNetwork(lan);
        simulator.addNetwork(man);
        simulator.addNetwork(wan);

        simulator.simulate();
    }
}

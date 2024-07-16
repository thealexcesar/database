package oop.oop1.examples.methods.overload;

import java.util.StringTokenizer;

public class Anime {
    private String name;
    private String author;
    private int episode;
    private String genre;


    {
        System.out.println("Before Constructor");
    }

    public Anime(String name, String author) {
        this.name = name;
        this.author = author;
    }

    public Anime(String name, String author, int episode) {
        this(name, author);
        this.episode = episode;
    }

    public Anime(String name, String author, int episode, String genre) {
        this(name, author, episode);
        this.genre = genre;
    }

    /*  public void initialize(String name) {
        this.name = name;
    }

    public void initialize(String name, String author, int episode) {
        this.initialize(name);
        this.author = author;
    }*/

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getEpisode() {
        return episode;
    }

    public void setEpisode(int episode) {
        this.episode = episode;
    }

    @Override
    public String toString() {
        return "Anime{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", episode=" + episode +
                ", genre='" + genre + '\'' +
                '}';
    }
}

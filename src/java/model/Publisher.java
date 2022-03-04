/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Publisher {
    private int publisherID;
    private String name;

    public Publisher() {
    }

    public Publisher(int publisherID, String name) {
        this.publisherID = publisherID;
        this.name = name;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Publisher{" + "publisherID=" + publisherID + ", name=" + name + '}';
    }
       
    
}

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
public class Account {
    private int userID;
    private String username;
    private String password;
    private String status;
    private int role;

    public Account() {
    }

    public Account(int userID, String username, String password, String status, int role) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", status=" + status + ", role=" + role + '}';
    }

    
}

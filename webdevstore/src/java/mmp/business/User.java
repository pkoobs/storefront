/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.business;

public class User {

    String name;
    String email;
    String address;
    String zip;
    String state;
    String city;
    String phoneNumber;
    String ccNumber;
    String ccExp;
    String password;
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCcExp() {
        return ccExp;
    }

    public void setCcExp(String ccExp) {
        this.ccExp = ccExp;
    }

    @Override
    public String toString() {
        return "Name: " + name
                + ", email: " + email
                + ", ccNum: " + ccNumber
                + ", ccExp: " + ccExp
                + ", address: " + address
                + ", city: " + city
                + ", zip: " + zip
                + ", state: " + state;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCcNumber() {
        return ccNumber;
    }

    public void setCcNumber(String ccNumber) {
        this.ccNumber = ccNumber;
    }

}

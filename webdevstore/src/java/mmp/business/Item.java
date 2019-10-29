/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.business;

import javax.persistence.Entity;
import java.io.Serializable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long itemId;
    String name;
    int bluRayQuantity = 0;
    int dvdQuantity = 0;
    int digitalQuantity = 0;
    float brPrice;
    float dvdPrice;
    float digitalPrice;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBluRayQuantity() {
        return bluRayQuantity;
    }

    public void setBluRayQuantity(int bluRayQuantity) {
        this.bluRayQuantity = bluRayQuantity;
    }

    public int getDvdQuantity() {
        return dvdQuantity;
    }

    public void setDvdQuantity(int dvdQuantity) {
        this.dvdQuantity = dvdQuantity;
    }

    public int getDigitalQuantity() {
        return digitalQuantity;
    }

    public void setDigitalQuantity(int digitalQuantity) {
        this.digitalQuantity = digitalQuantity;
    }

    public float getBrPrice() {
        return brPrice;
    }

    public void setBrPrice(float brPrice) {
        this.brPrice = brPrice;
    }

    public float getDvdPrice() {
        return dvdPrice;
    }

    public void setDvdPrice(float dvdPrice) {
        this.dvdPrice = dvdPrice;
    }

    public float getDigitalPrice() {
        return digitalPrice;
    }

    public void setDigitalPrice(float digitalPrice) {
        this.digitalPrice = digitalPrice;
    }

}

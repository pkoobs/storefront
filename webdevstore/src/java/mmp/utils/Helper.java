/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.utils;

import java.util.ArrayList;
import java.util.List;
import mmp.business.Item;

/**
 *
 * @author martin
 */
public class Helper {

    public static List<Item> sampleInventory() {

        ArrayList<Item> items = new ArrayList();
        Item item = new Item();

        item.setName("Movie 1");
        item.setBluRayQuantity(1);
        item.setBrPrice(1.11f);
        item.setDigitalQuantity(11);
        item.setDigitalPrice(11.11f);
        item.setDvdQuantity(111);
        item.setDvdPrice(111.11f);
        items.add(item);

        item = new Item();
        item.setName("Movie 2");
        item.setBluRayQuantity(2);
        item.setBrPrice(2.22f);
        item.setDigitalQuantity(22);
        item.setDigitalPrice(22.22f);
        item.setDvdQuantity(222);
        item.setDvdPrice(222.22f);
        items.add(item);

        item = new Item();
        item.setName("Movie 3");
        item.setBluRayQuantity(3);
        item.setBrPrice(3.3f);
        item.setDigitalQuantity(33);
        item.setDigitalPrice(33.33f);
        item.setDvdQuantity(333);
        item.setDvdPrice(333.33f);
        items.add(item);

        item = new Item();
        item.setName("Movie 4");
        item.setBluRayQuantity(4);
        item.setBrPrice(4.4f);
        item.setDigitalQuantity(44);
        item.setDigitalPrice(44.44f);
        item.setDvdQuantity(444);
        item.setDvdPrice(444.44f);
        items.add(item);

        item = new Item();
        item.setName("Movie 5");
        item.setBluRayQuantity(5);
        item.setBrPrice(5.5f);
        item.setDigitalQuantity(55);
        item.setDigitalPrice(55.55f);
        item.setDvdQuantity(555);
        item.setDvdPrice(555.55f);
        items.add(item);
        
        return items;

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.business;

import java.util.List;

public class Cart {

    User user;
    List<Item> items;
    Coupon coupon;

    public String toString() {
        return "total item count " + getTotalItemCount();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotalItemCount() {
        int total = 0;
        for (Item i : getItems()) {
            total += i.getBluRayQuantity() + i.getDigitalQuantity() + i.getDvdQuantity();
            System.out.println("total cart count is " + total);
        }
        return total;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public void addItem(Item item) {
        this.items.add(item);
    }

    public Item findItem(String name) {
        for (Item item : items) {
            if (item.name.equals(name)) {
                return item;
            }
        }
        return null;
    }

    public void cleanup() {
        int idx = -1;
        boolean allEmpty = false;
        for (Item item : items) {
            ++idx;

            if (item.getDigitalQuantity() <= 0
                    && item.getBluRayQuantity() <= 0
                    && item.getDvdQuantity() <= 0) {
                allEmpty = true;
                System.out.println("all quantities of " + item.getName() + " are 0, removing item");
                break;
            } else {
                System.out.println(item.getName() + " has "
                        + item.getDvdQuantity() + " dvd, "
                        + item.getDigitalQuantity() + " digital, "
                        + item.getBluRayQuantity() + " BR"
                );
            }
        }
        if (allEmpty) {
            System.out.println("removing index " + idx + " " + items.get(idx).getName());
            items.remove(idx);
        }
        System.out.println("total cart count " + getTotalItemCount());
    }

    public void removeItem(String name, String action) {
        System.out.println("trying to remove movie: " + name + " with type " + action);

        for (Item item : items) {
            if (item.name.equals(name)) {
                if (action.contains("Digital")) {
                    int q = item.getDigitalQuantity();
                    item.setDigitalQuantity(--q);
                    System.out.println("successfully decremented movie "
                            + item.getName() + " with new Digital quantity " + item.getDigitalQuantity());
                } else if (action.contains("Blu")) {
                    int q = item.getBluRayQuantity();
                    item.setBluRayQuantity(--q);
                    System.out.println("successfully decremented movie "
                            + item.getName() + " with BR quantity " + item.getBluRayQuantity());
                } else if (action.contains("DVD")) {
                    int q = item.getDvdQuantity();
                    item.setDvdQuantity(--q);
                    System.out.println("successfully decremented movie "
                            + item.getName() + " with DVD quanity " + item.getDvdQuantity());
                }

            }
        }
        cleanup();
    }
}

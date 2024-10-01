/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoan.session;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Teacher
 */
public class CartObj implements Serializable{
    private String CustomerId;
    private Map<String, Integer> items;

    
    public String getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(String CustomerId) {
        this.CustomerId = CustomerId;
    }

    public Map<String, Integer> getItems() {
        return items;
    }
    public void addItemToCart(String title){
        if(items == null){
            items = new HashMap<String,Integer>();
        }
        int quantity = 1;
        if(items.containsKey(title)){
            quantity = items.get(title) + 1;
        }
        items.put(title, quantity);
    }
    
    public void removeItemFromCart(String title){
        if(items.containsKey(title)){
            items.remove(title);
        }
        if(items.size() == 0){
            items = null;
        }
    }
}

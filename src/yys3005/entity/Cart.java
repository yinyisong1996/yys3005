package yys3005.entity;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<String,CartItem> map = new HashMap<>();



    //add
    public void addCartItem(CartItem cartItem){
        if (map.containsKey(cartItem.getBook().getBid())){
            CartItem cartItemBefore = map.get(cartItem.getBook().getBid());
            cartItemBefore.setCount(cartItemBefore.getCount()+cartItem.getCount());
            map.put(cartItem.getBook().getBid(),cartItemBefore);
        }else {
            map.put(cartItem.getBook().getBid(),cartItem);
        }
    }

    //del
    public void delCartItemById(String bid){ map.remove(bid); }

    //delAll
    public void delAllCartItem(){ map.clear(); }

    //getAll
    public Collection<CartItem> getAllCartItem(){ return map.values(); }


    //allTotal
    public Double getTotal(){
        BigDecimal total = new BigDecimal("0");
        for (CartItem cartItem : map.values()) {
            BigDecimal subTotal = new BigDecimal(cartItem.getSubtotal());
            total = total.add(subTotal);
        }
        return total.doubleValue();
    }





}

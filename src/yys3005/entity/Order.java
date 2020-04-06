package yys3005.entity;

import java.util.Date;
import java.util.List;

public class Order {

    private String oid;
    private Date ordertime;
    private Double alltotal;
    private String uid;
    private String address;
    private String state;//4种状态 1未付款 2付款未发货 3发货未收货 4收货成功


    private List<OrderItem> orderItemList;


    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", ordertime=" + ordertime +
                ", alltotal=" + alltotal +
                ", uid='" + uid + '\'' +
                ", address='" + address + '\'' +
                ", state='" + state + '\'' +
                ", orderItemList=" + orderItemList +
                '}';
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Double getAlltotal() {
        return alltotal;
    }

    public void setAlltotal(Double alltotal) {
        this.alltotal = alltotal;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

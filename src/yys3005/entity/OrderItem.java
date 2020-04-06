package yys3005.entity;

public class OrderItem {

    private String itemID;
    private Integer count;
    private Double subtotal;
    private String oid;
    private String bid;
    private Book book;

    private String errorBookNum;

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemID='" + itemID + '\'' +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", oid='" + oid + '\'' +
                ", bid='" + bid + '\'' +
                ", book=" + book +
                ", errorBookNum='" + errorBookNum + '\'' +
                '}';
    }

    public String getErrorBookNum() {
        return errorBookNum;
    }

    public void setErrorBookNum(String errorBookNum) {
        this.errorBookNum = errorBookNum;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }
}

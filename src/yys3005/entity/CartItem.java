package yys3005.entity;

import java.math.BigDecimal;

public class    CartItem {

    private Book book;
    private Integer count;

    public Double getSubtotal(){
        BigDecimal price = new BigDecimal(""+book.getPrice());
        BigDecimal c = new BigDecimal(""+count);
        return price.multiply(c).doubleValue();
    }


    @Override
    public String toString() {
        return "CartItem{" +
                "book=" + book +
                ", count=" + count +
                '}';
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}

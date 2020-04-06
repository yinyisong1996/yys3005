package yys3005.service;

import yys3005.entity.Book;
import yys3005.entity.OrderItem;
import yys3005.mapper.BookMapper;
import yys3005.mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private BookMapper bookMapper;

    public List<OrderItem> queryOrderItemByOid(String oid){
        List<OrderItem> orderItemList = orderItemMapper.queryOrderItemByOid(oid);
        for (OrderItem orderItem : orderItemList) {
            Book book = bookMapper.queryBookById(orderItem.getBid());
            orderItem.setBook(book);
        }
        return orderItemList;

    }

    public int deleteOrderItemByOid(String oid){
        return orderItemMapper.deleteOrderItemByOid(oid);
    }


}

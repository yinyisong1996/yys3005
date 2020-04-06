package yys3005.service;

import yys3005.entity.Book;
import yys3005.entity.Order;
import yys3005.entity.OrderItem;
import yys3005.mapper.BookMapper;
import yys3005.mapper.OrderItemMapper;
import yys3005.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    public int addOrder(Order order){
        orderMapper.addOrder(order);
        List<OrderItem> orderItemList = order.getOrderItemList();
        for (OrderItem orderItem: orderItemList) {
            orderMapper.addOrderItem(orderItem);
        }
        return 1;
    }

    public List<Order> queryOrderByUid(String uid){
        List<Order> ordersList = orderMapper.queryOrderByUid(uid);
        for (Order order: ordersList) {
            List<OrderItem> orderItemList = orderMapper.queryOrderItemByOrder(order.getOid());
            for (OrderItem orderItem : orderItemList) {
                Book book = bookMapper.queryBookById(orderItem.getBid());
                orderItem.setBook(book);
            }
            order.setOrderItemList(orderItemList);
        }
        return ordersList;
    }

    public Order selectOrderByOid(String oid){
        Order order = orderMapper.queryOrderByOid(oid);
        List<OrderItem> orderItemList = orderItemMapper.queryOrderItemByOid(oid);
        for (OrderItem orderItem : orderItemList) {
            Book book = bookMapper.queryBookById(orderItem.getBid());
            orderItem.setBook(book);
        }
        order.setOrderItemList(orderItemList);
        return order;
    }

    public int updateOrderState(String oid){
        return orderMapper.updateOrderState(oid);
    }

    public int updateOrderStateConfirm(String oid){
        return orderMapper.updateOrderStateConfirm(oid);
    }

    public int deleteOrderByOid(String oid){
        orderItemMapper.deleteOrderItemByOid(oid);
        orderMapper.deleteOrderByOid(oid);
        return 1;
    }






}

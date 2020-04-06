package yys3005.mapper;

import yys3005.entity.Order;
import yys3005.entity.OrderItem;

import java.util.List;

public interface OrderMapper {

    int addOrder(Order order);

    int addOrderItem(OrderItem orderItem);

    List<Order> queryOrderByUid(String uid);

    Order queryOrderByOid(String oid);

    List<OrderItem> queryOrderItemByOrder(String oid);

    int updateOrderState(String oid);

    int updateOrderStateConfirm(String oid);

    int deleteOrderByOid(String oid);

}

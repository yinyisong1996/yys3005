package yys3005.mapper;

import yys3005.entity.OrderItem;

import java.util.List;

public interface OrderItemMapper {


    int addOrderItemList(OrderItem orderItem);

    List<OrderItem> queryOrderItemByOid(String oid);

    int deleteOrderItemByOid(String oid);

}

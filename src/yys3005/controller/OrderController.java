package yys3005.controller;
// order control

import yys3005.entity.*;
import yys3005.entity.*;
import yys3005.service.AuthorService;
import yys3005.service.BookService;
import yys3005.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/orderServlet")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private BookService bookService;

    @RequestMapping("/addOrder")
    public void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart mycart = (Cart) request.getSession().getAttribute("mycart");

        Order myOrder = new Order();
        String s = UUID.randomUUID().toString().replaceAll("-","");
        myOrder.setOid(s);
        myOrder.setOrdertime(new Date());
        myOrder.setState("1");
        StoreUser storeUser = (StoreUser) request.getSession().getAttribute("storeUser");
        myOrder.setUid(storeUser.getUid());
        myOrder.setAlltotal(mycart.getTotal());
        myOrder.setAddress(storeUser.getAddress());

        List<OrderItem> orderItemList = new ArrayList<OrderItem>();
        for (CartItem cartItem: mycart.getAllCartItem() ) {
            OrderItem orderItem = new OrderItem();
            orderItem.setItemID(UUID.randomUUID().toString().replaceAll("-",""));
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setCount(cartItem.getCount());
            orderItem.setBid(cartItem.getBook().getBid());
            orderItem.setOid(myOrder.getOid());
            orderItem.setBook(cartItem.getBook());
            orderItemList.add(orderItem);
        }
        myOrder.setOrderItemList(orderItemList);

        orderService.addOrder(myOrder);

        request.setAttribute("myOrder",myOrder);

        request.getRequestDispatcher("/jsps/order/desc.jsp").forward(request,response);
    }

    @RequestMapping("/success")
    public void paySuccess(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        Order order = orderService.selectOrderByOid(oid);
        List<OrderItem> orderItemList = order.getOrderItemList();
        for (OrderItem orderItem : orderItemList) {
            int stock = bookService.queryBookStockById(orderItem.getBid());
            Integer count = orderItem.getCount();
            if (count>stock){
                orderItem.setErrorBookNum("Not enough items in stock, please edit your order!");
            }
        }
        for (OrderItem orderItem : orderItemList) {
            if (orderItem.getErrorBookNum()!=null){
                request.setAttribute("myOrder",order);
                request.getRequestDispatcher("/jsps/order/desc.jsp").forward(request,response);
                return;
            }
        }

        for (OrderItem orderItem : orderItemList) {
            int stock = bookService.queryBookStockById(orderItem.getBid());
            Integer count = orderItem.getCount();
            bookService.updateBookstockById(stock-count,orderItem.getBid());

            Double price = orderItem.getBook().getPrice();
            double f = price*count;
            String format = String.format("%.2f", f);
            double real = Double.parseDouble(format);

            String author_id = orderItem.getBook().getAuthor_id();
            Author author = authorService.queryAuthorById(author_id);
            Double realmoney = author.getMoney()+real;
            authorService.updateAuthorMoney(realmoney*0.4,author_id);
            if (bookService.queryBookStockById(orderItem.getBid())<10){
                bookService.updateBookstockById(500,orderItem.getBid());
            }
        }
        orderService.updateOrderState(oid);


        request.getRequestDispatcher("/jsps/order/result.jsp").forward(request,response);
    }
    // successfully paird

    @RequestMapping("/query")
    public void queryMyOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        StoreUser storeUser = (StoreUser) request.getSession().getAttribute("storeUser");
        List<Order> orderList = orderService.queryOrderByUid(storeUser.getUid());
        request.setAttribute("orderList",orderList);
        request.getRequestDispatcher("/jsps/order/list.jsp").forward(request,response);
    }
    // query my orders
    @RequestMapping("/toPay")
    public void toPay(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        Order order = orderService.selectOrderByOid(oid);
        request.setAttribute("myOrder",order);
        request.getRequestDispatcher("/jsps/order/desc.jsp").forward(request,response);
    }
    // waiting for payment
    @RequestMapping("/confirm")
    public void confirm(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        orderService.updateOrderStateConfirm(oid);
        request.getRequestDispatcher("/jsps/order/thank.jsp").forward(request,response);
    }
    // payment received
    @RequestMapping("/deleteOrder")
    public void deleteOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        orderService.deleteOrderByOid(oid);
        request.getRequestDispatcher("/orderServlet/query").forward(request,response);

    }
    // delete orders when unpaid



}

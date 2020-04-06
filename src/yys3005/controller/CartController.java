package yys3005.controller;
// shopping cart control

import yys3005.entity.*;
import yys3005.entity.Cart;
import yys3005.entity.CartItem;
import yys3005.entity.StoreUser;
import yys3005.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import yys3005.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/cartServlet")
public class CartController {

    @Autowired
    private BookService bookService;


    @RequestMapping("/addItem")
    public void addCartitem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart mycart = (Cart) request.getSession().getAttribute("mycart");
        String bid = request.getParameter("bid");
        int stock = bookService.queryBookStockById(bid);
        Integer countNum = Integer.valueOf(request.getParameter("count"));
        if (countNum>stock){
            String errorNum = new String("Not Enough in Stock!");
            request.setAttribute("errorNum",errorNum);
            request.getRequestDispatcher("/bookServlet/load?bid="+bid).forward(request,response);
            return;
        }
        StoreUser storeUser = (StoreUser) request.getSession().getAttribute("storeUser");
        if (storeUser==null){
            String errorStoreUser = new String("Please log in first!");
            request.setAttribute("errorStoreUser",errorStoreUser);
            request.getRequestDispatcher("/bookServlet/load?bid="+bid).forward(request,response);
            return;
        }
        Book book = bookService.queryBookById(bid);
        CartItem cartItem = new CartItem();
        cartItem.setCount(countNum);
        cartItem.setBook(book);
        mycart.addCartItem(cartItem);

//        System.out.println("all item：========="+mycart.getAllCartItem());
        request.getRequestDispatcher("/jsps/cart/list.jsp").forward(request,response);

    }
    // add items into shopping cart
    @RequestMapping("/clearItem")
    public void clearItem(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Cart mycart = (Cart) request.getSession().getAttribute("mycart");


        mycart.delAllCartItem();
        request.getRequestDispatcher("/jsps/cart/list.jsp").forward(request,response);
    }
    // empty shopping cart

    @RequestMapping("/deleteItem")
    public void deleteItem(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String bid = request.getParameter("bid");
//        Integer count = Integer.valueOf(request.getParameter("count"));
//        int stock = bookService.queryBookStockById(bid);
//        bookService.updateBookstockById(stock+count,bid);
        Cart mycart = (Cart) request.getSession().getAttribute("mycart");
        mycart.delCartItemById(bid);
        request.getRequestDispatcher("/jsps/cart/list.jsp").forward(request,response);
    }
    // remove 1 item from cart



}

package yys3005.controller;
// book control

import yys3005.entity.Book;
import yys3005.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/bookServlet")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/list")
    public void findAllbook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookService.findAllBooks();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/jsps/book/list.jsp").forward(request,response);
    }
    // find all books
    @RequestMapping("/load")
    public void loadBookMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bid = request.getParameter("bid");
        Book book = bookService.queryBookById(bid);
        request.setAttribute("bookMsg",book);
        request.getRequestDispatcher("/jsps/book/desc.jsp").forward(request,response);
    }
    // load book info
    
    @RequestMapping("/query")
    public void queryByCid(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        List<Book> bookList = bookService.queryByCategory(cid);
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/jsps/book/list.jsp").forward(request,response);
    }

    // find books by cid
    @RequestMapping("/search")
    public void searchBook(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String getSearch = request.getParameter("search");
        String search = "%"+getSearch+"%";
        List<Book> bookList = bookService.searchBookByItem(search);
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/jsps/book/list.jsp").forward(request,response);
    }

    // search books





}

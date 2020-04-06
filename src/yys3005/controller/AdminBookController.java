package yys3005.controller;

// admin for books
import yys3005.entity.Author;
import yys3005.entity.Book;
import yys3005.entity.Category;
import yys3005.mapper.BookMapper;
import yys3005.service.AuthorService;
import yys3005.service.BookService;
import yys3005.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/adminBookServlet")
public class AdminBookController {

    @Autowired                      //spring
    private BookService bookService;
    // book Service
    @Autowired
    private BookMapper bookMapper;
    // Mapper
    @Autowired
    private CategoryService categoryService;
    // book categories
    @Autowired
    private AuthorService authorService;
    // author service
    @RequestMapping("/list")    //url
    public void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookService.findAllBooks();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/adminjsps/admin/book/list.jsp").forward(request,response);
    }
    // query all books
    @RequestMapping("/load")
    public void prepareUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAllCategory();

        request.setAttribute("categoryList",categoryList);
        String bid = request.getParameter("bid");
        Book book = bookService.queryBookById(bid);
        request.setAttribute("book",book);

        List<Author> authorList = authorService.queryAllAuthor();
        request.setAttribute("authorList",authorList);

        request.getRequestDispatcher("/adminjsps/admin/book/desc.jsp").forward(request,response);
    }
    // prepare for editing towards db
    @RequestMapping("/update")
    public void updateBook(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String bid = request.getParameter("bid");
        String bname = request.getParameter("bname");
        Double price = Double.valueOf(request.getParameter("price"));
        String author_id = request.getParameter("author");
        String cid = request.getParameter("cid");

        bookService.updateBook(bname,price,author_id,cid,bid);

        request.getRequestDispatcher("/adminBookServlet/list").forward(request,response);
    }
    // update books
    @RequestMapping("/del")
    public void deleteBook(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String bid = request.getParameter("bid");
        bookService.deleteBookById(bid);
        request.getRequestDispatcher("/adminBookServlet/list").forward(request,response);
    }
    // delete books

    @RequestMapping("/addPre")
    public void addPre(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAllCategory();
        List<Author> authorList = authorService.queryAllAuthor();
        request.setAttribute("categoryList",categoryList);
        request.setAttribute("authorList",authorList);
        request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").forward(request,response);
    }
    // preparation before adding books
    @RequestMapping("/add")
    public void addBook(String bname,MultipartFile bimage,String price,String author_id,
                        String cid,String page,String ISBN,String stock,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("冲冲冲111111111111111");
        request.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        String originalFilename = bimage.getOriginalFilename();
       // System.out.println("originalFilename:----------"+originalFilename);

        //tomcat address
        String tomcatPath = request.getServletContext().getRealPath("/book_img/");
       // System.out.println("tomcatPath:----------"+tomcatPath);
        //create file from instance
        File file = new File(tomcatPath,originalFilename);
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdir();
        }
        //upload files
        bimage.transferTo(file);
        Book book = new Book();
        book.setBid(UUID.randomUUID().toString().replaceAll("-",""));
        book.setBimage("/book_img/"+originalFilename);
        book.setBname(bname);
        Double price1 = Double.valueOf(price);
        Integer page1 = Integer.valueOf(page);
        Integer stock1 = Integer.valueOf(stock);
        book.setPrice(price1);
        book.setAuthor_id(author_id);
        book.setCid(cid);

        book.setISBN(ISBN);
        book.setDel(0);
        book.setPage(page1);
        book.setStock(stock1);
        book.setSales(0);

        bookMapper.addBook(book);
        request.getRequestDispatcher("/adminBookServlet/list").forward(request,response);




    }










}

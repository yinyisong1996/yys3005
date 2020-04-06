package yys3005.controller;
// category control for users

import yys3005.entity.Category;
import yys3005.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/categoryServlet")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/findAll")
    public void findAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAllCategory();
        categoryList.forEach(System.out::println);
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/jsps/left.jsp").forward(request,response);

    }
    // find all category of books



}

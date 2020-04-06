package yys3005.controller;
// control book categories

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
import java.util.UUID;

@Controller
@RequestMapping("/adminCategoryServlet")
public class AdminCategoryController {

    @Autowired
    private CategoryService categoryService;
    // category service
    @RequestMapping("/list")
    public void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/adminjsps/admin/category/list.jsp").forward(request,response);
    }
    // query all categories
    @RequestMapping("/del")
    public void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        categoryService.deleteCategory(cid);
        List<Category> categoryList = categoryService.findAllCategory();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/adminjsps/admin/category/list.jsp").forward(request,response);
    }
    // delete categories
    @RequestMapping("/queryByCid")
    public void queryCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        String cid = request.getParameter("cid");
        Category category = categoryService.queryCategoryById(cid);
        request.setAttribute("category",category);
        request.getRequestDispatcher("/adminjsps/admin/category/mod.jsp").forward(request,response);
    }
    // query categories by cid
    @RequestMapping("/update")
    public void updateCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String cname = request.getParameter("cname");
        categoryService.updateCategory(cname,cid);
        request.getRequestDispatcher("/adminCategoryServlet/list").forward(request,response);

    }
    // update categories

    @RequestMapping("/add")
    public void addCategory(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String cname = request.getParameter("cname");
        Category category = new Category();
        category.setCid(UUID.randomUUID().toString().replaceAll("-",""));
        category.setCname(cname);
        categoryService.addCategory(category);
        request.getRequestDispatcher("/adminCategoryServlet/list").forward(request,response);
    }
    // add categories


}

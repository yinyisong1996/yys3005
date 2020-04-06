package yys3005.controller;
// administrator login page

import yys3005.entity.User;
import yys3005.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/adminServlet")
public class AdminController {

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/toView")
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            subject.login(token);
            User user = userMapper.selectByName(username);
            request.getSession().setAttribute("user",user);
            response.sendRedirect(request.getContextPath()+"/adminServlet/main");
        }catch (Exception e){
            e.printStackTrace();
            request.getRequestDispatcher("/adminjsps/login.jsp").forward(request,response);
        }
    // admin login check

    }

    @RequestMapping("/main")
    public void toMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/adminjsps/admin/main.jsp").forward(request,response);
    }
    // authentication check if valid account



}

package yys3005.controller;

//log in control
import yys3005.entity.Cart;
import yys3005.entity.StoreUser;
import yys3005.entity.User;
import yys3005.service.StoreUserService;
import yys3005.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@Controller
@SessionAttributes(names = {"mycart","storeUser"})      //add shopping cart and user info into session
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private StoreUserService storeUserService;


    @RequestMapping("/toRegist")
    public void toRegist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsps/regist.jsp").forward(request,response);
    }

    @RequestMapping("/regist")
    public ModelAndView regist(HttpServletRequest request,HttpServletResponse response){
        String username = request.getParameter("username");
        String account_name = request.getParameter("account_name");
        String password = request.getParameter("password");
        String gener = request.getParameter("gener");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        String uuid = UUID.randomUUID().toString().replaceAll("-","");

        User user = new User();
        user.setId(uuid);
        user.setUsername(username);
        user.setPassword(password);

        StoreUser storeUser = new StoreUser();
        storeUser.setUid(uuid);
        storeUser.setUname(username);
        storeUser.setAccount_name(account_name);
        storeUser.setGener(Integer.valueOf(gener));
        storeUser.setPhone(phone);
        storeUser.setEmail(email);
        storeUser.setAddress(address);

        userService.addUser(user);

        storeUserService.addStoreUser(storeUser);



        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/manage/main");
        return modelAndView;


    }




    @RequestMapping("/toLoginView")
    public ModelAndView toLoginView(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/manage/main");
        return modelAndView;
    }
    // spring
    @RequestMapping("/toUnauthorizedView")
    public void toUnauthorizedView(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/adminjsps/login.jsp").forward(request,response);
    }
    // unauthorized

    @RequestMapping("/login")
    public ModelAndView login(User user){
        ModelAndView modelAndView = new ModelAndView();
        try{
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
            subject.login(token);
            User user1 = userService.fingUserByName(user.getUsername());
            StoreUser storeUser = storeUserService.findStoreUserById(user1.getId());
            modelAndView.addObject("storeUser",storeUser);
            modelAndView.addObject("mycart",new Cart());
            modelAndView.setViewName("/manage/main");
        }catch (Exception e){
            e.printStackTrace();
            modelAndView.setViewName("login");
        }
        return modelAndView;

    // login
    }


    @RequestMapping("/exit")
    public ModelAndView exit(SessionStatus sessionStatus){
        ModelAndView modelAndView = new ModelAndView();
        sessionStatus.setComplete();
        modelAndView.setViewName("/manage/main");
        return modelAndView;
    }
    // exit



}

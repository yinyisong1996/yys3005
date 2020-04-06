package yys3005.controller;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@ControllerAdvice
public class ExceptionHandlerAdvice {

    @ExceptionHandler(UnauthorizedException.class)
    public String list(){
        return "unauthorized";
    }

// improve controller

}

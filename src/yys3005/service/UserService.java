package yys3005.service;

import yys3005.entity.User;
import yys3005.mapper.UserMapper;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User fingUserByName(String username){
        return userMapper.selectByName(username);
    }


    public Map<String, Set<String>> findRolesByName(String username){
        Map<String,Set<String>> authMap = new HashMap<>(2);
        authMap.put("roles",userMapper.selectRolesByName(username));
        authMap.put("prems",userMapper.selectPremsByName(username));
        return authMap;
    }


    public int addUser(User user){
        return userMapper.addUser(user);
    }

    @RequiresRoles(value = {"admin","user"},logical = Logical.OR)
    public void list(){
        System.out.println("======UserService===list()=====");
    }



}

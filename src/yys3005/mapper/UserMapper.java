package yys3005.mapper;

import yys3005.entity.User;

import java.util.Set;

public interface UserMapper {

    User selectByName(String username);

    Set<String> selectRolesByName(String username);

    Set<String> selectPremsByName(String username);

    int addUser(User user);





}

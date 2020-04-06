package yys3005.mapper;

import yys3005.entity.StoreUser;

public interface StoreUserMapper {

    StoreUser findStoreUserById(String uid);

    int addStoreUser(StoreUser storeUser);



}

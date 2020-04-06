package yys3005.service;


import yys3005.entity.StoreUser;
import yys3005.mapper.StoreUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreUserService {

    @Autowired
    private StoreUserMapper storeUserMapper;

    public StoreUser findStoreUserById(String uid){
        return storeUserMapper.findStoreUserById(uid);
    }

    public int addStoreUser(StoreUser storeUser){
        return storeUserMapper.addStoreUser(storeUser);
    }


}

package yys3005.service;


import yys3005.entity.Author;
import yys3005.mapper.AuthorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorService {

    @Autowired
    private AuthorMapper authorMapper;

    public List<Author> queryAllAuthor(){
        return authorMapper.queryAllAuthor();
    }

    public Author queryAuthorByName(String auther_name){
        return authorMapper.queryAuthorByName(auther_name);
    }

    public Author queryAuthorById(String auther_id){
        return authorMapper.queryAuthorById(auther_id);
    }

    public  int updateAuthorMoney(Double money,String auther_id){
        return authorMapper.updateAuthorMoney(money,auther_id);
    }


}

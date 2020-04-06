package yys3005.mapper;


import yys3005.entity.Author;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthorMapper {

    List<Author> queryAllAuthor();  // query all author, return list of author

    Author queryAuthorByName(String auther_name);   // query author by name

    Author queryAuthorById(String auther_id);   // query author by id

    int updateAuthorMoney(@Param("money") Double money,@Param("auther_id") String auther_id);
    // pay to author when required.

}

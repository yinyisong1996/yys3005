package yys3005.mapper;


import yys3005.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    List<Book> findAllBooks();

    Book queryBookById(String bid);

    int queryBookStockById(String bid);

    int updateBookstockById(@Param("count") Integer count,@Param("bid") String bid);

    List<Book> queryByCategory(String cid);

    int updateBook(@Param("bname") String bname,@Param("price") Double price,
                   @Param("author_id") String aid,@Param("cid") String cid,
                   @Param("bid") String bid);

    int deleteBookById(String bid);

    int addBook(Book book);

    List<Book> searchBookByItem(String search);

}

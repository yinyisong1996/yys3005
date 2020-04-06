package yys3005.service;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import yys3005.entity.Book;
import yys3005.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public List<Book> findAllBooks(){
        return bookMapper.findAllBooks();
    }

    public Book queryBookById(String bid){
        return bookMapper.queryBookById(bid);
    }

    public Page<Book> queryCurrPage(int page,int size){
        Page<Book> bookPage = PageHelper.startPage(page, size);
        bookMapper.findAllBooks();
        return bookPage;
    }

    public int queryBookStockById(String bid){
        return bookMapper.queryBookStockById(bid);
    }

    public int updateBookstockById(Integer count,String bid){
        return bookMapper.updateBookstockById(count,bid);
    }

    public List<Book> queryByCategory(String cid){
        return bookMapper.queryByCategory(cid);
    }

    public int updateBook(String bname,Double price,String aid,String cid,String bid){
        return bookMapper.updateBook(bname,price,aid,cid,bid);
    }

    public int deleteBookById(String bid){
        return bookMapper.deleteBookById(bid);
    }

    public List<Book> searchBookByItem(String search){
        return bookMapper.searchBookByItem(search);
    }

}

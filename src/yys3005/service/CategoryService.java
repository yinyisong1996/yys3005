package yys3005.service;


import yys3005.entity.Category;
import yys3005.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> findAllCategory(){
        return categoryMapper.queryAllCategory();
    }

    public int deleteCategory(String cid){
        return categoryMapper.deleteCategory(cid);
    }

    public int updateCategory(String cname,String cid){ return categoryMapper.updateCategory(cname,cid); }

    public Category queryCategoryById(String cid){
        return categoryMapper.queryCategoryById(cid);
    }

    public int addCategory(Category category){
        return categoryMapper.addCategory(category);
    }


}

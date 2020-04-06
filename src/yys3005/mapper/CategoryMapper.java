package yys3005.mapper;

import yys3005.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {

    List<Category> queryAllCategory();

    int deleteCategory(String cid);

    int updateCategory(@Param("cname") String cname,@Param("cid") String cid);

    Category queryCategoryById(String cid);

    int addCategory(Category category);
}

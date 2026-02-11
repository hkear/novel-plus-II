package com.java2nb.novel.dao;

import com.java2nb.novel.entity.BookCategoryDO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface BookCategoryDao {
    BookCategoryDO selectById(Long id);
    List<BookCategoryDO> selectList(Map<String, Object> params);
    int count(Map<String, Object> params);
    int insert(BookCategoryDO record);
    int updateById(BookCategoryDO record);
    int deleteById(Long id);
    int deleteBatch(Long[] ids);
    List<BookCategoryDO> selectByDirectionId(Long directionId);
}
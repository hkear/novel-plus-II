package com.java2nb.novel.service;

import com.java2nb.novel.entity.BookCategoryDO;
import java.util.List;
import java.util.Map;

public interface BookCategoryService {
    BookCategoryDO getById(Long id);
    List<BookCategoryDO> list(Map<String, Object> params);
    int count(Map<String, Object> params);
    int save(BookCategoryDO category);
    int update(BookCategoryDO category);
    int delete(Long id);
    int deleteBatch(Long[] ids);
    List<BookCategoryDO> listByDirectionId(Long directionId);
}
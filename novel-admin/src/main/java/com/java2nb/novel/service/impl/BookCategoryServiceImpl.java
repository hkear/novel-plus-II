package com.java2nb.novel.service.impl;

import com.java2nb.novel.dao.BookCategoryDao;
import com.java2nb.novel.entity.BookCategoryDO;
import com.java2nb.novel.service.BookCategoryService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BookCategoryServiceImpl implements BookCategoryService {

    @Resource
    private BookCategoryDao bookCategoryDao;

    @Override
    public BookCategoryDO getById(Long id) {
        return bookCategoryDao.selectById(id);
    }

    @Override
    public List<BookCategoryDO> list(Map<String, Object> params) {
        return bookCategoryDao.selectList(params);
    }

    @Override
    public int count(Map<String, Object> params) {
        return bookCategoryDao.count(params);
    }

    @Override
    public int save(BookCategoryDO category) {
        return bookCategoryDao.insert(category);
    }

    @Override
    public int update(BookCategoryDO category) {
        return bookCategoryDao.updateById(category);
    }

    @Override
    public int delete(Long id) {
        return bookCategoryDao.deleteById(id);
    }

    @Override
    public int deleteBatch(Long[] ids) {
        return bookCategoryDao.deleteBatch(ids);
    }

    @Override
    public List<BookCategoryDO> listByDirectionId(Long directionId) {
        return bookCategoryDao.selectByDirectionId(directionId);
    }
}
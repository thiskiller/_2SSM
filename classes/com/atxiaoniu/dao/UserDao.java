package com.atxiaoniu.dao;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface UserDao {

    public List<Book> getAllBook();

    public boolean addOrder(Order order);

    public List<Book> getAllBooks(@Param("min")double min, @Param("max") double max);

    public boolean  changeBook(Integer id, Integer integer);
}

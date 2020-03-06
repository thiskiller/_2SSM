package com.atxiaoniu.dao;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;

import java.util.List;

public interface ManagerDao {

    public List<Book> getAll();

    public Book getOneById(Integer id);

    public boolean saveBook(Book book);

    public boolean insertBook(Book book);

    public boolean deleteBook(Integer id);

    public List<Order> getAllOrders();

    public boolean changeCode(int id);

    public List<Order> selectOrders(String username);
}

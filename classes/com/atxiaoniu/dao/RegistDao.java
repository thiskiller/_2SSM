package com.atxiaoniu.dao;

import com.atxiaoniu.bean.User;

public interface RegistDao {

    public boolean selectByName(String username);

    public boolean RegistByUser(User user);
}

package com.atxiaoniu.dao;

import com.atxiaoniu.bean.User;

public interface LoginDao {

    public boolean isExist(User user);
    public boolean selectByUsernameAndPassword(User user);
}

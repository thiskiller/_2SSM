package com.atxiaoniu.service;

import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    LoginDao loginDao;

    public boolean isExistUserName(User user){
        return loginDao.isExist(user);
    }

    public boolean selectUser(User user){
        return loginDao.selectByUsernameAndPassword(user);
    }
}

package com.atxiaoniu.service;

import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.RegistDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistService {

    @Autowired
    RegistDao registDao;

    public boolean selectByName(String username){
        return registDao.selectByName(username);
    }

    public boolean RegistByUser(User user){

        return registDao.RegistByUser(user);
    }
}

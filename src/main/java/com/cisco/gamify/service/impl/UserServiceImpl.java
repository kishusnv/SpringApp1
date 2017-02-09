package com.cisco.gamify.service.impl;

import com.cisco.gamify.dao.UserDao;
import com.cisco.gamify.entity.User;
import com.cisco.gamify.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    public User findByEmpId(Integer empId) {
        return userDao.findById(empId);
    }

    @Transactional(readOnly = false)
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

 
    @Transactional(readOnly = false)
    public void deleteUser(Integer userName) {
        User user = userDao.findById(userName);
        if (user != null) {
            userDao.delete(user);
        }
    }


    public List<User> findUsers(Integer user) {
        return userDao.findUsers(user);
    }
}

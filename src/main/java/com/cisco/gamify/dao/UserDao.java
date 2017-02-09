package com.cisco.gamify.dao;

import com.cisco.gamify.entity.User;

import java.util.List;

public interface UserDao extends AbstractDao<User, Integer> {
    void saveUser(User user);
    List<User> findUsers(Integer empId);
}

package com.cisco.gamify.service;

import com.cisco.gamify.entity.User;

import java.util.List;

public interface UserService {

    User findByEmpId(Integer empId);
    void saveUser(User user);
    void deleteUser(Integer empId);
    List<User> findUsers(Integer user);
}

package com.cisco.gamify.dao.impl;

import com.cisco.gamify.dao.UserDao;
import com.cisco.gamify.entity.User;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends AbstractDaoImpl<User, Integer> implements UserDao {

    protected UserDaoImpl() {
        super(User.class);
    }

    public void saveUser(User user) {
        saveOrUpdate(user);
    }

    public List<User> findUsers(Integer empId) {
        return findByCriteria(Restrictions.ilike("empId", empId));
    }
}

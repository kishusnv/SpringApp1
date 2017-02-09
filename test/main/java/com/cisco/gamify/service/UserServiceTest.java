package com.cisco.gamify.service;

import com.cisco.gamify.entity.User;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml", "classpath:spring/hibernateContext.xml"})
public class UserServiceTest {

    @Autowired
    private UserService userService;

    private final Integer empId = 1111;

    @After
    public void tearDown() throws Exception {
        userService.deleteUser(empId);
    }

    @Test
    public void testSaveUser() throws Exception {
        User user = createUser();
        User found = userService.findByEmpId(user.getEmpId());
        assertEquals(user, found);
    }

    private User createUser() {
        User user = new User(empId, "firstName", "lastName", "password");
        user.setCreatedOn(new Date());
        userService.saveUser(user);
        return user;
    }

    @Test
    public void testSearchUser() throws Exception {
        createUser();
        List<User> users = userService.findUsers(1111);
        assertEquals(1, users.size());
        assertEquals("user01", users.iterator().next().getUserName());
    }

    @Test
    public void testDeleteUser() throws Exception {
        createUser();
        assertNotNull(userService.findByEmpId(1111));
        userService.deleteUser(1111);
        assertNull(userService.findByEmpId(1111));
    }

    @Test
    public void testUpdateUser() throws Exception {
        createUser();
        User user01 = userService.findByEmpId(1111);
        assertNotNull(user01);
        assertEquals("firstName", user01.getFirstName());
        assertEquals("lastName", user01.getLastName());

        user01.setFirstName("newFirstName");
        user01.setLastName("newLastName");
        userService.saveUser(user01);

        User found = userService.findByEmpId(1111);
        assertNotNull(found);
        assertEquals("newFirstName", found.getFirstName());
        assertEquals("newLastName", found.getLastName());
    }
}

package com.cisco.gamify.controller;

import com.cisco.gamify.entity.User;
import com.cisco.gamify.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser( Model model, User user) {
        User existing = userService.findByEmpId(user.getEmpId());
        if (existing != null) {
            model.addAttribute("status", "exist");
            return "welcome";
        }
        user.setCreatedOn(new Date());
        userService.saveUser(user);
        model.addAttribute("saved", "success");
        return "welcome";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchUser(Model model, User user) {
        List<User> users = userService.findUsers(user.getUserName());
        model.addAttribute("users", users);
        return "welcome";
    }

    @RequestMapping(value = "/edit/{userName}", method = RequestMethod.GET)
    public String updateUser(Model model, @PathVariable Integer empId) {
        User user = userService.findByEmpId(empId);
        model.addAttribute("user", user);
        return "update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser( Model model, User user) {
        userService.saveUser(user);
        model.addAttribute("saved", "success");
        return "update";
    }
    @RequestMapping(value = "/delete/{userName}", method = RequestMethod.GET)
    public String deleteUser(Model model, @PathVariable Integer empId) {
        userService.deleteUser(empId);
        model.addAttribute("deleted", "success");
        model.addAttribute("user", new User());
        return "welcome";
    }

}

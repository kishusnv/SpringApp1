package com.cisco.gamify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cisco.gamify.entity.User;

@Controller
public class SORTGamificationController {
	
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showUserForm(Model model) {
        model.addAttribute("user",new User());
        return "home";
    }
    @RequestMapping(value = "/sortstatus", method = RequestMethod.GET)
    public String showStatusGame(Model model) {
      //  model.addAttribute("user",new User());
        return "sortstatus";
    }
	
}

package com.ssi.drugstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model, String error, String logout) {

        return login(model, error, logout);
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String indexLogin(Model model, String error, String logout) {
        return login(model, error, logout);
    }

    private String login(Model model, String error, String logout) {

        if (error != null)
            model.addAttribute("error", "Niepoprawna nazwa użytkowanika lub hasło.");

        if (logout != null)
            model.addAttribute("message", "Zostałeś poprawnie wylogowany.");

        return "/login";
    }
}

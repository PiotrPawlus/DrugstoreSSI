package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Manufacturer;
import com.ssi.drugstore.model.Profile;
import com.ssi.drugstore.model.User;
import com.ssi.drugstore.repository.ManufacturerRepository;
import com.ssi.drugstore.repository.ProfileRepository;
import com.ssi.drugstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/profile")
public class ProfileController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index(Principal principal, HttpServletRequest request)
    {
        ModelMap map = new ModelMap();
        User currentUser = userRepository.findByUsername(principal.getName());
        Profile profile = new Profile();
        map.put("user", currentUser);
        map.put("profile", new Profile());
        return new ModelAndView("profile", map);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("profile") Profile profile, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) return new ModelAndView("profile", bindingResult.getModel());

        ProfileRepository.createOrUpdate(profile);

        return new ModelAndView("profile", "profile", profile);
    }


}

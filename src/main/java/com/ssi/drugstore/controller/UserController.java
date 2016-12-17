package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.User;
import com.ssi.drugstore.service.SecurityService;
import com.ssi.drugstore.service.UserService;
import com.ssi.drugstore.validator.UserValidator;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sun.plugin.com.BeanClass;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/users")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {

        request.setAttribute("user", new User());
        request.setAttribute("users", users());

        return "users";
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        User user = getUserByID(id);

        return new ModelAndView("usersEdit", "user", user);
    }


    @RequestMapping(method = RequestMethod.POST)
    public String create(@ModelAttribute User user, BindingResult bindingResult, ModelMap model){

        if (bindingResult.hasErrors()) {
            return "index";
        }

        userService.save(user);

        securityService.autologin(user.getUsername(), user.getPasswordConfirm());



        model.addAttribute("user",new User());

        return "redirect:/dashboard/users";
    }


    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        User user = getUserByID(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.delete(user);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        ModelMap map = new ModelMap();
        map.put("user", new User());
        map.put("users", users());

        return "redirect:/dashboard/users";
    }


    private List users() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List users = new ArrayList();

        try {

            transaction = session.beginTransaction();
            users = session.createQuery("from User").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return users;
    }


    private User getUserByID(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        User user;

        try {

            transaction = session.beginTransaction();
            user = (User) session.get(User.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return user;
    }

}

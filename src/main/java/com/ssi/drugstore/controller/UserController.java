package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/users")
public class UserController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index() {

        ModelMap map = new ModelMap();
        map.put("user", new User());
        map.put("users", users());
        return new ModelAndView("users", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        User user = getUserByID(id);

        return new ModelAndView("usersForm", "user", user);
    }


    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(User user, BindingResult bindingResult){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.saveOrUpdate(user);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return new ModelAndView("users", "users", users());
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

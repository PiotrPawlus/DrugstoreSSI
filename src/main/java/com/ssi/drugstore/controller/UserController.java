package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard")
public class UserController {

    @RequestMapping(value = "users")
    public ModelAndView index() {
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
}

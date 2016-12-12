package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piotrpawlus on 12/12/2016.
 */
@Controller
@RequestMapping("/dashboard/categories")
public class CategoryController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index() {
        return medicineModelAndView();
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(Category category, BindingResult bindingResult) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.saveOrUpdate(category);
            transaction.commit();
        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

        return new ModelAndView("categories", "categories", Category.categories());
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine() {

        ModelMap map = new ModelMap();
        map.put("category", new Category());

        return new ModelAndView("categoryForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Category medicine = Category.getCategoryForIdentifier(id);

        return new ModelAndView("categoryForm", "category", medicine);
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id) {

        Category medicine = Category.getCategoryForIdentifier(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.delete(medicine);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicineModelAndView();
    }

    /* Private */

    private ModelAndView medicineModelAndView() {
        return new ModelAndView("categories", "categories", Category.categories());
    }

}

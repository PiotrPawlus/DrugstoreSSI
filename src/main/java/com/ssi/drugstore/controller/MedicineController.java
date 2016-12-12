package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Medicine;

import org.hibernate.*;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/medicines")
public class MedicineController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index() {
        return medicineModelAndView();
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(Medicine medicine, BindingResult bindingResult) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.saveOrUpdate(medicine);
            transaction.commit();
        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

        return new ModelAndView("medicines", "medicines", medicines());
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine() {

        ModelMap map = new ModelMap();
        map.put("medicine", new Medicine());

        return new ModelAndView("medicineForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Medicine medicine = getMedicineForIdentifier(id);

        return new ModelAndView("medicineForm", "medicine", medicine);
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id) {

        Medicine medicine = getMedicineForIdentifier(id);

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
        return new ModelAndView("medicines", "medicines", medicines());
    }

    private Medicine getMedicineForIdentifier(String id) {

        int identifier = Integer.parseInt(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Medicine medicine;

        try {

            transaction = session.beginTransaction();
            medicine = (Medicine) session.get(Medicine.class, identifier);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicine;
    }

    private List medicines() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        List medicines = new ArrayList();

        try {

            transaction = session.beginTransaction();
            medicines = session.createQuery("from Medicine").list();
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return medicines;
    }
}
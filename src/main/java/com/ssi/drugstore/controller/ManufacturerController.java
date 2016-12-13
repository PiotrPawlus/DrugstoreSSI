package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Manufacturer;
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

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/producers")
public class ManufacturerController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index() {
        return manufacturerModelAndView();
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(Manufacturer manufacturer, BindingResult bindingResult) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.saveOrUpdate(manufacturer);
            transaction.commit();
        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

        return manufacturerModelAndView();
    }

    @RequestMapping(value = "/new")
    public ModelAndView newManufacturer() {

        ModelMap map = new ModelMap();
        map.put("manufacturer", new Manufacturer());

        return new ModelAndView("manufacturerForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Manufacturer manufacturer = Manufacturer.getForIdentifier(id);

        return new ModelAndView("manufacturerForm", "manufacturer", manufacturer);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        Manufacturer manufacturer = Manufacturer.getForIdentifier(id);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {

            transaction = session.beginTransaction();
            session.delete(manufacturer);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null) transaction.rollback();
            throw e;

        } finally {
            session.close();
        }

        return "redirect:/dashboard/producers";
    }

    /* Private */

    private ModelAndView manufacturerModelAndView() {
        return new ModelAndView("manufacturers", "manufacturers", Manufacturer.all());
    }

}

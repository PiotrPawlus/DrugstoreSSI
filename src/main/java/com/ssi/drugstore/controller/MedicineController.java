package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Medicine;

import org.hibernate.*;

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

        Category category = medicine.getCategory();
        Category newCategory = Category.getForIdentifier(category.getId());
        medicine.setCategory(newCategory);

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

        return new ModelAndView("medicines", "medicines", Medicine.all());
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine() {

        ModelMap map = new ModelMap();
        map.put("medicine", new Medicine());
        map.put("categories", Category.all());

        return new ModelAndView("medicineForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Medicine medicine = Medicine.getForIdentifier(id);
        medicine.setCategory(null);

        ModelMap map = new ModelMap();
        map.put("medicine", medicine);
        map.put("categories", Category.all());

        return new ModelAndView("medicineForm", map);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        Medicine medicine = Medicine.getForIdentifier(id);

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

        return "redirect:/dashboard/medicines";
    }

    /* Private */

    private ModelAndView medicineModelAndView() {
        return new ModelAndView("medicines", "medicines", Medicine.all());
    }
}

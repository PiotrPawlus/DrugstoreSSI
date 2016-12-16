package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Manufacturer;
import com.ssi.drugstore.repository.ManufacturerRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

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

        ManufacturerRepository.createOrUpdate(manufacturer);

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

        Manufacturer manufacturer = ManufacturerRepository.getForIdentifier(id);

        return new ModelAndView("manufacturerForm", "manufacturer", manufacturer);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        Manufacturer manufacturer = ManufacturerRepository.getForIdentifier(id);
        ManufacturerRepository.delete(manufacturer);
        return "redirect:/dashboard/producers";
    }

    /* Private */

    private ModelAndView manufacturerModelAndView() {
        return new ModelAndView("manufacturers", "manufacturers", ManufacturerRepository.all());
    }

}

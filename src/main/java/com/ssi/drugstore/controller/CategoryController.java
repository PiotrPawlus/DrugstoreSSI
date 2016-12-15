package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Category;
import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.repository.CategoryRepository;
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
        return categoryModelAndView();
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("categoryForm") Category category, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return new ModelAndView("categoryForm", bindingResult.getModel());
        }

        CategoryRepository.createOrUpdate(category);

        return categoryModelAndView();
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine() {

        ModelMap map = new ModelMap();
        map.put("category", new Category());

        return new ModelAndView("categoryForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Category category = CategoryRepository.getForIdentifier(id);

        return new ModelAndView("categoryForm", "category", category);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        Category category = CategoryRepository.getForIdentifier(id);
        CategoryRepository.delete(category);

        return "redirect:/dashboard/categories";
    }

    /* Private */

    private ModelAndView categoryModelAndView() {
        return new ModelAndView("categories", "categories", CategoryRepository.all());
    }
}

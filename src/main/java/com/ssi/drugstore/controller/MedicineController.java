package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.*;

import com.ssi.drugstore.repository.CategoryRepository;
import com.ssi.drugstore.repository.ManufacturerRepository;
import com.ssi.drugstore.repository.MedicineRepository;
import com.ssi.drugstore.repository.SeriesRepository;
import org.hibernate.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

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
    public ModelAndView create(@Valid @ModelAttribute("medicineForm") Medicine medicine, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) return new ModelAndView("medicineForm", bindingResult.getModel());

        MedicineRepository.createOrUpdate(medicine);

        return new ModelAndView("medicines", "medicines", MedicineRepository.all());
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine() {

        ModelMap map = new ModelMap();
        map.put("medicine", new Medicine());
        map.put("categories", CategoryRepository.all());
        map.put("manufacturers", ManufacturerRepository.all());

        return new ModelAndView("medicineForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) {

        Medicine medicine = MedicineRepository.getForIdentifier(id);
        medicine.setCategory(null);
        medicine.setManufacturer(null);

        ModelMap map = new ModelMap();
        map.put("medicine", medicine);
        map.put("categories", CategoryRepository.all());
        map.put("manufacturers", ManufacturerRepository.all());

        return new ModelAndView("medicineForm", map);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String id) {

        Medicine medicine = MedicineRepository.getForIdentifier(id);
        MedicineRepository.delete(medicine);

        return "redirect:/dashboard/medicines";
    }

    @RequestMapping(value = "/series/{id}")
    public ModelAndView seriesIndex(@PathVariable String id) {

        Medicine medicine = MedicineRepository.getForIdentifier(id);
        List<Series> seriesList = SeriesRepository.allForMedicineId(id);

        ModelMap map = new ModelMap();
        map.put("seriesList", seriesList);
        map.put("medicine", medicine);

        return new ModelAndView("series", map);
    }

    /* Private */

    private ModelAndView medicineModelAndView() {
        return new ModelAndView("medicines", "medicines", MedicineRepository.all());
    }
}

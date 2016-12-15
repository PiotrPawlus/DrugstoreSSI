package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.HibernateUtil;
import com.ssi.drugstore.model.Medicine;
import com.ssi.drugstore.model.Series;
import com.ssi.drugstore.repository.MedicineRepository;
import com.ssi.drugstore.repository.SeriesRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard/medicines/series")
public class SeriesController {

    @RequestMapping(value = "/{medicineId}", method = RequestMethod.GET)
    public ModelAndView index(@PathVariable String medicineId) {
        return seriesModelAndView(medicineId);
    }

    @RequestMapping(value = "/{medicineId}", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("series") Series series, @PathVariable String medicineId, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) return new ModelAndView("seriesForm", bindingResult.getModel());
        SeriesRepository.createOrUpdate(series, medicineId);

        return seriesModelAndView(medicineId);
    }

    @RequestMapping(value = "/{medicineId}/new")
    public ModelAndView newMedicine(@PathVariable String medicineId) {

        Medicine medicine = MedicineRepository.getForIdentifier(medicineId);
        ModelMap map = new ModelMap();
        map.put("series", new Series());
        map.put("medicine", medicine);

        return new ModelAndView("seriesForm", map);
    }

    @RequestMapping(value = "/{medicineId}/edit/{id}")
    public ModelAndView edit(@PathVariable String medicineId, @PathVariable String id) {

        Medicine medicine = MedicineRepository.getForIdentifier(medicineId);
        Series series = SeriesRepository.getForIdentifier(id);

        ModelMap map = new ModelMap();
        map.put("medicine", medicine);
        map.put("series", series);

        return new ModelAndView("seriesForm", map);
    }

    @RequestMapping(value = "/{medicineId}/delete/{id}")
    public String delete(@PathVariable String medicineId, @PathVariable String id) {

        Series series = SeriesRepository.getForIdentifier(id);
        SeriesRepository.delete(series);

        return "redirect:/dashboard/medicines/series/" + medicineId;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /* Private */

    private ModelAndView seriesModelAndView(String medicineId) {

        Medicine medicine = MedicineRepository.getForIdentifier(medicineId);
        ModelMap map = new ModelMap();
        map.put("seriesList", SeriesRepository.allForMedicineId(medicineId));
        map.put("medicine", medicine);

        return new ModelAndView("series", map);
    }
}

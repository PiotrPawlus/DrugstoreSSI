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
@RequestMapping("/dashboard/medicines/series/{medicineId}")
public class SeriesController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index(@PathVariable String medicineId) {

        if (!MedicineRepository.isExisting(medicineId)) return medicineModelAndView();
        return seriesModelAndView(medicineId);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView create(@ModelAttribute("seriesForm") @Valid Series series, @PathVariable String medicineId, BindingResult bindingResult) {

        if (!MedicineRepository.isExisting(medicineId)) return medicineModelAndView();
        if (bindingResult.hasErrors()) return new ModelAndView("seriesForm", bindingResult.getModel());

        series.setMedicine(MedicineRepository.getForIdentifier(medicineId));
        SeriesRepository.createOrUpdate(series, medicineId);

        return seriesModelAndView(medicineId);
    }

    @RequestMapping(value = "/new")
    public ModelAndView newMedicine(@PathVariable String medicineId) {

        if (!MedicineRepository.isExisting(medicineId)) return medicineModelAndView();
        Medicine medicine = MedicineRepository.getForIdentifier(medicineId);
        ModelMap map = new ModelMap();
        map.put("series", new Series());
        map.put("medicine", medicine);

        return new ModelAndView("seriesForm", map);
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String medicineId, @PathVariable String id) {

        if (!MedicineRepository.isExisting(medicineId)) return medicineModelAndView();
        if (!SeriesRepository.isExisting(id)) return seriesModelAndView(medicineId);

        Medicine medicine = MedicineRepository.getForIdentifier(medicineId);
        Series series = SeriesRepository.getForIdentifier(id);
        series.setMedicine(null);
        ModelMap map = new ModelMap();
        map.put("medicine", medicine);
        map.put("series", series);

        return new ModelAndView("seriesForm", map);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable String medicineId, @PathVariable String id) {

        if (!MedicineRepository.isExisting(medicineId)) return "redirect:/dashboard/medicines";

        Series series = SeriesRepository.getForIdentifier(id);
        if (SeriesRepository.isExisting(id)) SeriesRepository.delete(series);

        return "redirect:/dashboard/medicines/series/" + medicineId;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
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

    private ModelAndView medicineModelAndView() {
        return new ModelAndView("medicines", "medicines", MedicineRepository.all());
    }
}

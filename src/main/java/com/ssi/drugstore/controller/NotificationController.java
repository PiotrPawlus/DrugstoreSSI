package com.ssi.drugstore.controller;

import com.ssi.drugstore.model.Medicine;
import com.ssi.drugstore.model.Series;
import com.ssi.drugstore.repository.MedicineRepository;
import com.ssi.drugstore.repository.SeriesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by piotrpawlus on 11/12/2016.
 */

@Controller
@RequestMapping("/dashboard")
public class NotificationController {

//    @RequestMapping(method = RequestMethod.GET)
//    public ModelAndView index() {
//        return notifications();
//    }

    @RequestMapping(value = "/notifications")
    public ModelAndView show() { return notifications(); }

    private ModelAndView notifications() {

        List<Medicine> allMedicine = MedicineRepository.all();
        List<Medicine> lowMedicineList = new ArrayList<Medicine>();
        List<Medicine> emptyMedicineList = new ArrayList<Medicine>();

        for (Medicine medicine: allMedicine) {

            if (SeriesRepository.isLowAmount(medicine.getId())) {
                lowMedicineList.add(medicine);
            }

            if (SeriesRepository.isEmpty(medicine.getId())) {
                emptyMedicineList.add(medicine);
            }
        }

        ModelMap map = new ModelMap();
        map.put("lowMedicineList", lowMedicineList);
        map.put("emptyMedicineList", emptyMedicineList);

        return new ModelAndView("notifications", map);
    }
}

package com.ssi.drugstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping(value = "/dashboard")
public class SaleController {

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return seals();
    }

    @RequestMapping(value = "/sales")
    public String show() { return seals(); }

    private String seals() {
        return "sales";
    }
}

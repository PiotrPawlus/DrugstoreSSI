package com.ssi.drugstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by piotrpawlus on 11/12/2016.
 */
@Controller
@RequestMapping("/dashboard")
public class LexiconController {

    @RequestMapping(value = "/lexicon")
    public String index() {
        return "lexicon";
    }
}
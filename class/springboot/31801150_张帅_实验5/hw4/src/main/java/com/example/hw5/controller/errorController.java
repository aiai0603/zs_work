package com.example.hw5.controller;

import com.example.hw5.Entity.stuEntity;
import com.example.hw5.Service.stuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/error")
public class errorController implements ErrorController {


    @Override
    public String getErrorPath() {
        return null;
    }


    @RequestMapping
    String error(){

        return "error";
    }
}

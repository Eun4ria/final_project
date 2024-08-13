package com.web.finalProject.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LanController {
/*
    private final LocaleResolver localeResolver;

    @Autowired
    public LanController(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }
    // http://localhost:4040/sendMail
    @GetMapping("/sendMail")
    public String mailFrm(@RequestParam(value = "lang", required = false) String lang, HttpServletRequest request, HttpServletResponse response) {
        if (lang != null) {
            Locale locale;
            switch (lang) {
                case "ko":
                    locale = new Locale("ko");
                    break;
                case "en":
                    locale = new Locale("en");
                    break;
                default:
                    locale = Locale.ENGLISH; // 湲곕낯媛믪쑝濡� �꽕�젙�븷 �뼵�뼱
            }
            localeResolver.setLocale(request, response, locale);
        }
        return "WEB-INF\\views\\NewFile.jsp";
    }
    */
}
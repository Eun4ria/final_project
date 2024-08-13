package com.web.finalProject.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import com.web.finalProject.service.A01_Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LanController {
	/*
    private final LocaleResolver localeResolver;
    
    @Autowired(required=false)
    private A01_Service service;

    public LanController(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }
    
    // http://localhost:4040/profile
    @GetMapping("profile")
    public String mailFrm(@RequestParam(value = "lang", required = false) String lang, HttpServletRequest request, HttpServletResponse response, Model d) {
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
                    locale = Locale.ENGLISH; // 기본값으로 설정할 언어
            }
            localeResolver.setLocale(request, response, locale);
        }
        HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");        
        System.out.println("프로필 user_id:"+user_id);        
        d.addAttribute("currentUrl", request.getRequestURI());
        d.addAttribute("profile", service.getProfile(user_id));
        
        return "WEB-INF\\views\\a01_profile.jsp";
    }
    */
}

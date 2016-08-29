package com.xgw.crm.controller.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/demo")
public class DemoController {
	
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		System.out.println("index14444");
		return "start"; 
	}

	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(HttpServletRequest request, Model model) {
		System.out.println("index14444");
		return "adminIndex"; 
	}

	
	
} 

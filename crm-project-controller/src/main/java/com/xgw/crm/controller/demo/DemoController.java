package com.xgw.crm.controller.demo;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xgw.crm.service.file.FileService;


@Controller
@RequestMapping(value = "/demo")
public class DemoController {
	private static Logger logger = Logger.getLogger(DemoController.class);
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		System.out.println("index14444");
		return "start"; 
	}

	
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String table(HttpServletRequest request, Model model) {
		logger.info("---------------table");
		logger.info("--------------22222table");
		return "table/table"; 
	}

	
	
} 

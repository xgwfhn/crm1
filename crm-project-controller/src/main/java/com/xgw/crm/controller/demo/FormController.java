package com.xgw.crm.controller.demo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xgw.crm.entity.product.Product;
import com.xgw.crm.entity.user.User;
import com.xgw.crm.service.file.FileService;
import com.xgw.crm.service.user.UserService;


@Controller
@RequestMapping(value = "/form")
public class FormController {
	private static Logger logger = Logger.getLogger(FormController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(HttpServletRequest request, Model model) {
		System.out.println("form");
		return "form/form"; 
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public String  addUser(HttpServletRequest request, Model model) {
		logger.info("---------------iDisplayLength:");
				
		User u=new User();
		u.setFirst_name(request.getParameter("username"));
		u.setLast_name(request.getParameter("password"));
		try {
			userService.addUser(u);
			return "{\"code\":\"1\",\"message\":\"ok\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"code\":\"0\",\"message\":\"error\"}";
		}
		
	}
	
	

	
} 

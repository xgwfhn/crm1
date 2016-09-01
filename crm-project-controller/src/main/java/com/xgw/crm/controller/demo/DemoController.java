package com.xgw.crm.controller.demo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xgw.crm.entity.product.Product;
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
		List<Product> list=new ArrayList<Product>();
		for(int i=0;i<10;i++){
			Product product=new Product();
			product.setItemid(i+"");
			product.setListprice(10.0F);
			product.setProductname(i+"_笔记本");
			product.setStatus("1");
			product.setUnitcost("台");
			list.add(product);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalPages", 10);
		//request.setAttribute("aa", 22);
		return "table/table"; 
	}

	@RequestMapping(value = "/getCurrentPageData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCurrentPageData(HttpServletRequest request, Model model) {
		logger.info("---------------getCurrentPageData");
		logger.info("---------------currentPage:"+request.getParameter("page"));
		List<Product> list=new ArrayList<Product>();
		for(int i=0;i<10;i++){
			Product product=new Product();
			product.setItemid(i+"");
			product.setListprice(10.0F);
			product.setProductname(i+"_手机"+request.getParameter("page"));
			product.setStatus("1");
			product.setUnitcost("部");
			list.add(product);
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalPages", 10);
		return map; 
	}
	
	
} 

package com.xgw.crm.controller.demo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xgw.crm.entity.product.Product;
import com.xgw.crm.entity.user.User;
import com.xgw.crm.service.file.FileService;


@Controller
@RequestMapping(value = "/table")
public class TableController {
	private static Logger logger = Logger.getLogger(TableController.class);
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
	
	@RequestMapping(value = "/table1", method = RequestMethod.GET)
	public String table1(HttpServletRequest request, Model model) {
		logger.info("---------------table1");
		//request.setAttribute("aa", 22);
		return "table/table1"; 
	}
	
	
	/**跳转到 datatables插件分页
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/table2", method = RequestMethod.GET)
	public String table2(HttpServletRequest request, Model model) {
		logger.info("---------------table2");
		//request.setAttribute("aa", 22);
		return "table/table2"; 
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
	
	
	
	/** bootstrap-table 分页插件 初始化时 加载数据方法 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getCurrentPageData1", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getCurrentPageData1(HttpServletRequest request, Model model) {
		logger.info("---------------getCurrentPageData1");
		logger.info("---------------sortName:"+request.getParameter("sortName"));//必须已get方式 请求  才能获取参数
		logger.info("---------------sortOrder:"+request.getParameter("sortOrder"));
		
		
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
		map.put("rows", list);//记录数据及总记录数   key  必须为写死为rows,total   由插件所决定
		map.put("total", 10);
		return map; 
	}
	
	
	/** datatables插件分页  初始化时 加载数据方法 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getCurrentPageData2", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getCurrentPageData2(HttpServletRequest request, Model model) {
		logger.info("---------------getCurrentPageData2");
		logger.info("---------------sortName:"+request.getParameter("sortName"));//必须已get方式 请求  才能获取参数
		logger.info("---------------sortOrder:"+request.getParameter("sortOrder"));
		
		
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
		map.put("data", list);//记录数据及总记录数   key  必须为写死为rows,total   由插件所决定
		map.put("recordsTotal", 10);
		map.put("recordsFiltered", 10);
		map.put("draw", 1);
		return map; 
	}
	
	
	/**datatables插件分页  初始化时 加载数据方法 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getCurrentPageData3", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject  getCurrentPageData3(HttpServletRequest request, Model model) {
		List<User> list=new ArrayList<User>();
		for(int i=0;i<12;i++){
			User user=new User();
			user.setFirst_name("Airi"+i);
			user.setLast_name("Satou"+i);
			user.setPosition("Accountant"+i);
			user.setOffice("Tokyo"+i);
			user.setSalary("$86,000");;
			user.setStart_date("2015/02/12");
			list.add(user);
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("aaData", list);//记录数据及总记录数   key  必须为写死为rows,total   由插件所决定
		
		//String aa="{\"aaData\":[{\"first_name\":\"Airi\",\"last_name\":\"Satou\",\"position\":\"Accountant\",\"office\":\"Tokyo\",\"start_date\":\"28th Nov 08\",\"salary\":\"$162,700\"},{\"first_name\":\"Angelica\",\"last_name\":\"Ramos\",\"position\":\"Chief Executive Officer (CEO)\",\"office\":\"London\",\"start_date\":\"9th Oct 09\",\"salary\":\"$1,200,000\"},{\"first_name\":\"Ashton\",\"last_name\":\"Cox\",\"position\":\"Junior Technical Author\",\"office\":\"San Francisco\",\"start_date\":\"12th Jan 09\",\"salary\":\"$86,000\"},{\"first_name\":\"Bradley\",\"last_name\":\"Greer\",\"position\":\"Software Engineer\",\"office\":\"London\",\"start_date\":\"13th Oct 12\",\"salary\":\"$132,000\"},{\"first_name\":\"Brenden\",\"last_name\":\"Wagner\",\"position\":\"Software Engineer\",\"office\":\"San Francisco\",\"start_date\":\"7th Jun 11\",\"salary\":\"$206,850\"},{\"first_name\":\"Brielle\",\"last_name\":\"Williamson\",\"position\":\"Integration Specialist\",\"office\":\"New York\",\"start_date\":\"2nd Dec 12\",\"salary\":\"$372,000\"},{\"first_name\":\"Bruno\",\"last_name\":\"Nash\",\"position\":\"Software Engineer\",\"office\":\"London\",\"start_date\":\"3rd May 11\",\"salary\":\"$163,500\"},{\"first_name\":\"Caesar\",\"last_name\":\"Vance\",\"position\":\"Pre-Sales Support\",\"office\":\"New York\",\"start_date\":\"12th Dec 11\",\"salary\":\"$106,450\"},{\"first_name\":\"Cara\",\"last_name\":\"Stevens\",\"position\":\"Sales Assistant\",\"office\":\"New York\",\"start_date\":\"6th Dec 11\",\"salary\":\"$145,600\"},{\"first_name\":\"Cedric\",\"last_name\":\"Kelly\",\"position\":\"Senior Javascript Developer\",\"office\":\"Edinburgh\",\"start_date\":\"29th Mar 12\",\"salary\":\"$433,060\"},{\"first_name\":\"Cara\",\"last_name\":\"Stevens\",\"position\":\"Sales Assistant\",\"office\":\"New York\",\"start_date\":\"6th Dec 11\",\"salary\":\"$145,600\"},{\"first_name\":\"Cedric\",\"last_name\":\"Kelly\",\"position\":\"Senior Javascript Developer\",\"office\":\"Edinburgh\",\"start_date\":\"29th Mar 12\",\"salary\":\"$433,060\"}]}";
		return JSONObject.fromObject(map);
	}
	
} 

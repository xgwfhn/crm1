package com.xgw.crm.controller.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xgw.crm.entity.product.Product;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		System.out.println("index14444");
		return "index"; 
	}
	
	/**跳转到多记录提交页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/recordsSubmit", method = RequestMethod.GET)
	public String recordsSubmit(HttpServletRequest request, Model model) {
		System.out.println("recordsSubmit");
		return "recordsSubmit"; 
	}
	
	/**跳转到多表单提交页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/jumpFormsSubmit", method = RequestMethod.GET)
	public String jumpFormsSubmit(HttpServletRequest request, Model model) {
		System.out.println("formsSubmit");
		return "formsSubmit"; 
	}
	
	
	/**测试json字符串
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody	//加上@ResponseBody,说明改方法不会跳转到页面,而是返回json字符串
	public String add(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("name"));//获取表单数据
		return "{\"success\":\"true\"}"; 
	}
	
	/**测试将map转为json字符串
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add1", method = RequestMethod.POST)
	@ResponseBody	//加上@ResponseBody,说明改方法不会跳转到页面,此处调用spring工具类 自动将map转为 json字符串   
	public Map<String,Object> add1(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("name"));//获取表单数据
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("success", true);
		return map; 
	}
	
	
	/**批量提交表格中的多条记录,并将记录转为Object[]
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/batchSubmit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> batchSubmit(HttpServletRequest request, Model model) {
		String json = request.getParameter("dataJson");   
		System.out.println("json:"+json);
		if(StringUtils.isNotEmpty(json)){//StringUtils为commons-lang下的工具类
			JSONArray array =JSONArray.fromObject(json);
		    Product[] objs = new Product[array.size()];   
		    for (int i = 0; i < array.size(); i++) {  
		        JSONObject jsonObject = array.getJSONObject(i);  
		        objs[i] = (Product) JSONObject.toBean(jsonObject, Product.class);  
		    } 
		    for(Product pro:objs){
		    	System.out.println(pro.getItemid());   
		    }
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("success", true);
			map.put("datas", objs);
			return map; 
		}
		return null;
	}
	
	
	/**多表单提交
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formsSubmit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> formsSubmit(HttpServletRequest request, Model model) {
		String json = request.getParameter("dataJson");   
		System.out.println("-----name:"+request.getParameter("name"));
		System.out.println("-----json:"+json);
		return null;
	}
	
	
	
} 

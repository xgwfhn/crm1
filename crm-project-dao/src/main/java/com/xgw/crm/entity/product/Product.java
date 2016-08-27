package com.xgw.crm.entity.product;

public class Product {

	//{"status":"P","itemid":"11","productid":"K9-DL-01","listprice":"","unitcost":"","attr1":"","productname":"Dalmation"}
	private String status;
	private String itemid;
	private String productid;
	private float listprice;
	private String unitcost;
	private String attr1;
	private String productname;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public float getListprice() {
		return listprice;
	}
	public void setListprice(float listprice) {
		this.listprice = listprice;
	}
	public String getUnitcost() {
		return unitcost;
	}
	public void setUnitcost(String unitcost) {
		this.unitcost = unitcost;
	}
	public String getAttr1() {
		return attr1;
	}
	public void setAttr1(String attr1) {
		this.attr1 = attr1;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	
}

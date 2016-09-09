package com.xgw.crm.dao;

import java.util.List;

import com.xgw.crm.entity.user.User;

public interface UserDao extends BaseDao<User>  {
	public List<User> queryUser(String openid, String date); 
}

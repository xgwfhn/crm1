package com.xgw.crm.service.user;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xgw.crm.dao.UserDao;
import com.xgw.crm.entity.user.User;

@Service
public class UserServiceImpl implements UserService {
	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	
	@Transactional
	public void addUser(User u) throws Exception {
		userDao.persist(u);
	}

}

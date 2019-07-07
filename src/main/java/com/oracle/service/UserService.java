package com.oracle.service;

import java.util.List;

import com.oracle.dao.NewsDao;
import com.oracle.dao.UserDao;
import com.oracle.entity.PageBean;
import com.oracle.entity.Users;

//业务层 调用数据访问层
public class UserService {
	UserDao dao = new UserDao();
	public Users login(String username,String password){
		return dao.login(username, password);
	}
	
	
	public int register(String username,String password,String realname ){
		return dao.registerUser(username,password,realname);
	}
	

	public List<Users> findAllUsers() {
		return dao.findusers();
	}


	public int deleteUserById(int uid) {
		return dao.deleteUser(uid);
		
	}


	public Users FindById(int uid) {
		// TODO Auto-generated method stub
		return dao.finduserbyid(uid);
	}


	public int updateUserById(Users users) {
		// TODO Auto-generated method stub
		return dao.updateuser(users);
	}


	public PageBean<Users> getUserPageByParam(int pc, int ps,String username) {
		// TODO Auto-generated method stub
		return UserDao.getUserBypage(pc,ps,username);
	}


}

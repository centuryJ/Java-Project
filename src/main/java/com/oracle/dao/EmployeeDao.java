package com.oracle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.oracle.entity.Employee;
import com.oracle.entity.PageBean;
import com.oracle.entity.Users;
import com.oracle.util.ConnUtil;

public class EmployeeDao {

	public List<Employee> getEmployees() {
		List<Employee> employees = new ArrayList<Employee>();
		Connection conn = null;
		Employee emp = null;
		//获取连接
		try {
			conn = ConnUtil.getConn();
			String sql = "select * from employee";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()){
				emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setPassword(rs.getString("password"));
				emp.setRealname(rs.getString("realname"));
				employees.add(emp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//访问数据库
		return employees;
	}

	public Employee login(String name,String password){
		Connection conn = null;
		Employee emp = null;
		//获取连接
		try {
			conn = ConnUtil.getConn();
			String sql = "select * from employee where name = ? and password = ?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();
			if(rs.next()){
				emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setRealname(rs.getString("realname"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//访问数据库
		return emp;
	}

	public PageBean<Employee> getUserBypage(int pc, int ps, String name) {
		int len = findNum();
		//实例化当前页面对象
		PageBean<Employee> pemp = new PageBean<Employee>();
		pemp.setPc(pc);//当前页数 比如 第一页 为 1,第二页 为 2 
		pemp.setPs(ps);//每页记录数 比如每页显示 5 行
		pemp.setTr(len);//总记录数  比如  总共有为 9 行
		String sql = "";
		List<Employee> emph = new ArrayList<Employee>();
		Employee ee = null;
		if(name == null){
			sql = "select * from employee limit ?,?";
		}else{
			sql = "select * from employee where name like ? limit ?,?";
		}
		Connection conn = null;
		try {
			conn = ConnUtil.getConn();
			PreparedStatement pstm = conn.prepareStatement(sql);
			if(name == null){
				pstm.setInt(1,(pc-1)*ps);
				pstm.setInt(2,ps);
			}else{
				pstm.setString(1, name);
				pstm.setInt(2,(pc-1)*ps);
				pstm.setInt(3,ps);
			}
			ResultSet rs = pstm.executeQuery();
			while(rs.next()){
				ee = new Employee();
				ee.setId(rs.getInt("id"));
				ee.setPassword(rs.getString("password"));
				ee.setName(rs.getString("name"));
				ee.setRealname(rs.getString("realname"));
				emph.add(ee);
			}
			pemp.setBeanList(emph);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return pemp;
	}

	public static int findNum() {
		Connection conn = null;
		int count = 0;
		try {
			conn = ConnUtil.getConn();
			String sql = "select count(*) as count from employee";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
}

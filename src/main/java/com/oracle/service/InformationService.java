package com.oracle.service;

import java.util.List;

import com.oracle.dao.InformationDao;
import com.oracle.entity.Information;
import com.oracle.entity.PageBean;

public class InformationService {

	public int addInfo(String title, String time, String context) {
		return InformationDao.addInformation(title,time,context);
	}

	public List<Information> getAllInfomation() {
		// TODO Auto-generated method stub
		return InformationDao.getInformation();
	}

	public int deleteInfoById(int id) {
		// TODO Auto-generated method stub
		return InformationDao.deleteInfo(id);
	}

	public Information getInfomationById(int id) {
		// TODO Auto-generated method stub
		return InformationDao.getInfomation(id);
	}

	public int updateInfo(Information info) {
		// TODO Auto-generated method stub
		return InformationDao.UpdateInfo(info);
	}

	public List<Information> getFiveInfos() {
		// TODO Auto-generated method stub
		return InformationDao.getFiveInfos();
	}
	
	public PageBean<Information> getInfoPageByParam(int pc, int ps, String title) {
		return InformationDao.getInfoBypage(pc,ps,title);
	}
}

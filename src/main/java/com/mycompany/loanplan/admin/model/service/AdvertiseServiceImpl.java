package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.admin.model.dao.AdvertiseDao;
import com.mycompany.loanplan.admin.model.vo.Administor;
import com.mycompany.loanplan.admin.model.vo.Advertise;

@Service("advertiseService")
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired
	private AdvertiseDao advertiseDao;
	
	@Override
	public List<Advertise> advertiseList(){
		return advertiseDao.advertiseList();
	}
	
	@Override
	public int advertiseAdd(Advertise ad){
		return advertiseDao.advertiseAdd(ad);
	}
	
	@Override
	public int deleteAdvertise(int AD_NUM){
		return advertiseDao.deleteAdvertise(AD_NUM);
	}
	
}

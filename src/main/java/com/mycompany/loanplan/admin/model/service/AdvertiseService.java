package com.mycompany.loanplan.admin.model.service;

import java.util.List;

import com.mycompany.loanplan.admin.model.vo.Advertise;

public interface AdvertiseService {

	List<Advertise> advertiseList();
	int advertiseAdd(Advertise ad);
	int deleteAdvertise(int AD_NUM);
}

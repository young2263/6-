package com.mycompany.loanplan.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.admin.model.vo.Advertise;

@Repository
public class AdvertiseDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Advertise> advertiseList(){
		return sqlSession.selectList("Advertise.advertiseList");
	}
	
	
}

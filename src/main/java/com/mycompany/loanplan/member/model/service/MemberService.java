package com.mycompany.loanplan.member.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.member.model.dao.MemberDao;
import com.mycompany.loanplan.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public List<Member> selectMembers(){
		return memberDao.selectMembers();
	}
	
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}
	
	public int userIdCheck(String m_id) {
		return memberDao.checkOverId(m_id);
	}
}

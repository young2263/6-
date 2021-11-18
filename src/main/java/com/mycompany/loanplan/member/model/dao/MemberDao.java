package com.mycompany.loanplan.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Member> selectMembers(){
		System.out.println("list");
		return sqlSession.selectList("Member.listMember");
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}
	
	public int updateMember(Member m) {
		return sqlSession.update("Member.updateMember", m);
	}
	public int deleteMember(String userid) {
		return sqlSession.delete("Member.deleteMember", userid);
	}
	
	public int checkOverId(String m_id) {
		return sqlSession.selectOne("Member.checkOverId");
	}
}


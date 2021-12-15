package com.mycompany.loanplan.member.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.loanplan.member.model.dao.MemberDao;
import com.mycompany.loanplan.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public List<Member> memberlist(){
		return memberDao.memberlist();
	}
	public Member selectMember(Member m){
		return memberDao.selectMember(m);
	}
	
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}
	
	public Member checkIdDup(String userid){
		return memberDao.checkIdDup(userid);
	}
	
	public int userIdCheck(String m_id) {
		return memberDao.checkOverId(m_id);
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public Member viewMember(Member vo) {
		return memberDao.viewMember(vo);
	}
	
	public boolean loginCheck(Member vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if(result) {
			Member vo2 = viewMember(vo);
			session.setAttribute("m_id", vo2.getM_id());
			session.setAttribute("m_name", vo2.getM_name());
		}
		return result;
	}
	
	public Member login(Member vo) throws Exception{
		return memberDao.login(vo);
	}
	
	public int signUp(Member vo) throws Exception {
		return memberDao.signUp(vo);
	}
	
	public Member myPage(Member vo) throws Exception{
		Member m = memberDao.myPage(vo);
		return m;
	}
	
	public int updateMember(Member vo) {
		return memberDao.updateMember (vo);
	}
	
	public void updatePwd(Member vo) {
		memberDao.updatePwd(vo);
	}
	
	public int deleteMember(String m_id) {
		return memberDao.deleteMember(m_id);
	}
	
	public Member findId(Member vo) throws Exception {
		return memberDao.findId(vo);
	}
	
	public Member findPwd(Member vo) throws Exception {
		return memberDao.findPwd(vo);
	}
}

package com.mycompany.loanplan.member.model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.loanplan.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public MemberDao() {
	} // Session 객체를 얻어 올 getSqlSessionFactory 메소드 구현

	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis/mybatis-config.xml";
		SqlSessionFactory factory = null;

		try {
			// InputStream으로 Mybatis의 설정 정보를 읽어 온다
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			factory = builder.build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return factory;
	}

	public List<Member> memberlist() {
		return sqlSession.selectList("Member.memberlist");
	}
	
	public Member selectMember(Member m) {
		Member member = null;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			member = session.selectOne("Member.loginCheck", m);
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return member;
	}

	public int insertMember(Member m) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.insert("Member.insertMember", m);

			// 세션 생성 시 AutoCommit을 false로 설정하였으므로 // commit / rollback을 직접 관리한다.
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	public int updateMember(Member m) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.update("Member.updateMember", m);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	public int deleteMember(String m_id) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.delete("Member.deleteMember", m_id);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public Member checkIdDup(String m_id) {
		Member member = null; SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			member = session.selectOne("Member.memberInfo", m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return member;
	}


	public int checkOverId(String m_id) {
		return sqlSession.selectOne("Member.checkOverId");
	}
	
	public boolean loginCheck(Member vo) {
		String name = sqlSession.selectOne("Member.loginCheck", vo);
		return (name==null)? false : true;
	}
	
	public Member viewMember(Member vo) {
		return sqlSession.selectOne("Member.viewMember", vo);
	}
	
	public void logout(HttpSession session) {
	}
	
	public Member login(Member vo) {
		return sqlSession.selectOne("Member.loginMember", vo);
	}
}

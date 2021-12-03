package com.mycompany.loanplan.admin.scheduler;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledAdmin {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// fixedDelay task가 종료된 후 지정시간 후 task 실행
	// fixedRate task가 시작되고 다시 시작될때까지의 지정시간
	// cron ="초 분 시 일 월 요일"
	// cron ="초 분 시 일 월 요일 년" - 써도 되고 안써도됨
//	@Scheduled(cron = "3 * * * * *")
//	public void test() {
//		//task 부분
//		System.out.println("test");
//	}
	
}

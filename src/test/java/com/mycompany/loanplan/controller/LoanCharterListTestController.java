package com.mycompany.loanplan.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.mycompany.loanplan.loan.controller.RecommendLoanCharterController;
import com.mycompany.loanplan.loan.model.service.RecommendLoanCharterService;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({
	"classpath:WEB-INF\\spring\\root-context.xml",
	"classpath:WEB-INF\\spring\\appServlet\\servlet-context.xml"})
public class LoanCharterListTestController {
	
	@Mock
	RecommendLoanCharterService recommendLoanCharterService;
	
	@InjectMocks
	private RecommendLoanCharterController rlchCtrl;
	
	private MockMvc mmvc;
	
	@Before
	public void beforeTest() {
		
		MockitoAnnotations.initMocks(this);
		this.mmvc = MockMvcBuilders.standaloneSetup(rlchCtrl).build();
	}
	
	@Test
	public void testRecommendLoanCharterList() throws Exception {
		
		this.mmvc.perform(get("/recommendloan/recommendloancharterlist").param("page", "1"))
		.andExpect(status().isOk())
		.andExpect(view().name("recommendloan/recommendloancharterlist"));
	}

}

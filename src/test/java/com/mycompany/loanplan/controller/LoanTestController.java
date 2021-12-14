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

import com.mycompany.loanplan.loan.controller.RecommendLoanController;
import com.mycompany.loanplan.loan.model.service.RecommendLoanService;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({
	"classpath:WEB-INF\\spring\\root-context.xml",
	"classpath:WEB-INF\\spring\\appServlet\\servlet-context.xml"})
public class LoanTestController {
	
	@Mock
	RecommendLoanService recommendLoanService;
	
	@InjectMocks
	private RecommendLoanController rlCtrl;

	private MockMvc mmvc;
	
	@Before
	public void beforeTest() {
		
		MockitoAnnotations.initMocks(this);
		this.mmvc = MockMvcBuilders.standaloneSetup(rlCtrl).build();
	}
	
	@Test
	public void testRecommendLoandt() throws Exception {
		this.mmvc.perform(get("/recommendloan/recommendloandt").param("rlnum", "1"))
		.andExpect(status().isOk())
		.andExpect(view().name("recommendloan/recommendloandt"));
	}
}

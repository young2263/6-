package com.mycompany.loanplan.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.mycompany.loanplan.admin.controller.AdministorController;
import com.mycompany.loanplan.admin.model.service.AdministorService;
import com.mycompany.loanplan.admin.model.service.AdministorServiceImpl;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({
	"WEB-INF/spring/root-context.xml",
	"WEB-INF/spring/appServlet/servlet-context.xml"
})
public class TestController {

	@Mock
	AdministorServiceImpl service;
	
	@InjectMocks
	private AdministorController controller;
	
	private MockkMvc mmvc;
	
	@Before
	public void beforeTest() {
		
		MockitoAnnotations.initMocks(this);
		this.mmvc = MockMvcBuilders.standaloneSetup(controller).build();
	}
	
	@Test
	public void testAdministor() throws Exception {
		this.mmvc.perform(get("admin"))
		.andExpect(status().isOk());
		
	}
	
}

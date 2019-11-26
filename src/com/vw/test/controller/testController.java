package com.vw.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




import com.vw.engine.po.engines_location;
import com.vw.engine.service.EngineService;
import com.vw.test.po.test;


@Controller
@RequestMapping("/test")
public class testController {
	@Autowired
	private EngineService engineService;
	@RequestMapping("/testlist")
	@ResponseBody
	public List<test> engineLocationlist(Model model)throws Exception {
		
		List<test> testList =new ArrayList<test>();
		test test1=new test();
		test1.setId("1");
		test1.setInvdate("asd");
		test1.setName("as");
		testList.add(test1);
		return testList;	
		
	}
	
}

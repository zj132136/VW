package com.vw.engine.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jili.login.po.ActiveUser;
import com.jili.user.po.User;
import com.jili.user.po.UserCustom;
import com.vw.engine.po.CylinderPressure;
import com.vw.engine.po.Engine;
import com.vw.engine.po.EngineParts;
import com.vw.engine.po.EngineRecordInfo;
import com.vw.engine.po.EngineTest;
import com.vw.engine.po.EngineTestBasic;
import com.vw.engine.po.NitrogenLeakage;
import com.vw.engine.po.OilConsumption;
import com.vw.engine.po.OilPressure;
import com.vw.engine.po.OilPressureTurboActuator;
import com.vw.engine.po.TurboChargerVoltage;
import com.vw.engine.po.engines_location;
import com.vw.engine.service.EngineService;
import com.vw.test.po.test;


@Controller
@RequestMapping("/engine")
public class engineController {
	@Autowired
	private EngineService engineService;
	@RequestMapping("/engineList")
	public String engineList(Model model,Engine engine)throws Exception {
		
		List<Engine> enginesList =engineService.selectEngine(engine);
		
		model.addAttribute("enginesList",enginesList);
		model.addAttribute("countModel",enginesList.size());
		return "/DataDictionary/engine";	
		
	}
	@RequestMapping("/engineEdit")
	public String engineEdit(Model model,Integer id)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();		
		Engine engine =engineService.selectEngineById(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engine",engine);
		model.addAttribute("username", username);
		return "/DataDictionary/engineEdit";	
		
	}
	@RequestMapping("/engineEditSubmit")
	public void engineEditSubmit(Engine engine)throws Exception {	
		engineService.engineEditSubmit(engine);
	}
	@RequestMapping("/delEngine")
	public void delEngine(Integer id)throws Exception {
		engineService.delEngine(id);		
	}
	@RequestMapping("/engineAdd")
	public String engineAdd(Model model)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		return "/DataDictionary/engineAdd";	
		
	}
	@RequestMapping("/engineAddSubmit")
	public void engineAddSubmit(Engine engine)throws Exception {
		engineService.engineAddSubmit(engine);	
	}
	@RequestMapping("/engineLocationlist")
	public String engineLocationlist(Model model)throws Exception {
		
		List<engines_location> enginesList =engineService.selectEngines_location();
		
		model.addAttribute("enginesList",enginesList);
		model.addAttribute("countModel",enginesList.size());
		return "/DataDictionary/locationDatabase";	
		
	}
	@RequestMapping("/engineLocationEdit")
	public String engineLocationEdit(Model model,Integer id)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();	
		Integer location_id=id;
		engines_location engine =engineService.selectEngines_locationById(location_id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engine",engine);
		model.addAttribute("username", username);
		return "/DataDictionary/engineLocationEdit";	
		
	}
	@RequestMapping("/engineLocationEditSubmit")
	public void engineLocationEditSubmit(engines_location engineslocation)throws Exception {	
		engineService.engineLocationEditSubmit(engineslocation);
	}
	@RequestMapping("/engineLocationAdd")
	public String engineLocationlAdd(Model model)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		return "/DataDictionary/engineLocationAdd";	
		
	}
	@RequestMapping("/engineLocationAddSubmit")
	public void engineLocationAddSubmit(engines_location engineslocation)throws Exception {
		engineService.engineLocationAddSubmit(engineslocation);		
	}
	
	@RequestMapping("/delEngineLocation")
	public void delEngineLocation(Integer id)throws Exception {
		engineService.delEngineLocation(id);		
	}
	
	@RequestMapping("/testlist")
	@ResponseBody
	public List<test> testlist(Model model)throws Exception {
		
		List<test> testList =new ArrayList<test>();
		for(int i=0;i<25;i++){
			test test1=new test();
			test1.setId("1");
			test1.setInvdate("asd");
			test1.setName("as");
			testList.add(test1);
		}
		
		return testList;	
		
	}
	@RequestMapping("/testlist1")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, Object> params,ServletRequest request)throws Exception
	{
		
		String startTime= request.getParameter("starttime");
        String endTime= request.getParameter("endtime");
        String engineName= request.getParameter("engineName");
        EngineRecordInfo engineRecordinfo= new EngineRecordInfo();
        engineRecordinfo.setStartTime(startTime);
        engineRecordinfo.setEndTime(endTime);
        engineRecordinfo.setEngineName(engineName);
		   String page=(String) params.get("pageNum");
		   String rows=(String) params.get("limit");
	         
	       //查询分页详情
		   Map<String,Object> testList =engineService.selectEngineRecordInfo(page,rows,engineRecordinfo);
		
	       return testList;
	}
	@RequestMapping("/engineLocationlistJson")
	@ResponseBody
	public Map<String, Object> engineLocationlistJson(ServletRequest request)throws Exception {
		 String page="";
		 String rows="";
		 Engine engine= new Engine(); 
		Map<String, Object> map = engineService.engineLocationlistJson(page, rows, engine);
		
		return map;	
		
	}
	@RequestMapping("/engineRecordAdd")
	public String engineRecordAdd(Model model)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		//发动机号
		List<String> engineList= engineService.selectEngineName();
		Map<String, String> engineListMap = new HashMap<String, String>();
			for(int i=0;i<engineList.size();i++){
				engineListMap.put(engineList.get(i), engineList.get(i));
			}
		//发动机位置
		List<engines_location> enginesLocationList =engineService.selectEngines_location();
		Map<String, String> enginesLocationListMap = new HashMap<String, String>();
			for(int j=0;j<enginesLocationList.size();j++){
				engines_location location = enginesLocationList.get(j);
				String locationDetail = location.getLocation();
				enginesLocationListMap.put(locationDetail, locationDetail);
			}
		model.addAttribute("engineList", engineListMap);
		model.addAttribute("enginesLocationList", enginesLocationListMap);
		return "/engineTest/engineTestAdd";		
	}
	@RequestMapping("/engineRecordAddSubmit")
	public void engineRecordAddSubmit(EngineRecordInfo engineRecordInfo)throws Exception {
		engineService.engineRecordInfoAddSubmit(engineRecordInfo);	
	}
	
	@RequestMapping("/engineTestBasicListByEngineId")
	public String engineTestBasicListByEngineNum(Model model,String id)throws Exception {
		EngineTestBasic engineTestBasic= new EngineTestBasic();
		if(id!=null||!"".equals(id)){
			engineTestBasic.setEngineId(id);
		}
		
		List<EngineTestBasic> engineTestBasiclist =engineService.selectEngineTestBasic(engineTestBasic);
		List<EngineRecordInfo> engineRecordInfoList = new ArrayList<EngineRecordInfo>();
		if(engineTestBasiclist.size()>0){
			
			for(int i=0;i<engineTestBasiclist.size();i++){
				int intid = 0;
				if(id!=null&&!"".equals(id)&&id!="null"&&!"null".equals(id)){
					intid=Integer.valueOf(id);
				}
				EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(intid);
				engineRecordInfo.setId(engineTestBasiclist.get(i).getId());
				engineRecordInfoList.add(engineRecordInfo);
			}
		}
		model.addAttribute("engineId",id);
		model.addAttribute("engineRecordInfoList",engineRecordInfoList);
		model.addAttribute("countengineRecordInfoList",engineRecordInfoList.size());
		return "/engineTest/EngineTestBasic/engineTestBasicFromTest";	
		
	}
	@RequestMapping("/engineBasicInfoAdd")
	public String engineBasicInfoAdd(Model model,Integer id)throws Exception {
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
      //发动机号//发动机位置
      	EngineRecordInfo engineRecordInfo =engineService.selectEngineRecordInfoById(id);
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/EngineTestBasic/engineTestBasicAdd";		
	}
	
	@RequestMapping("/engineBasicAddSubmit")
	public void engineBasicAddSubmit(EngineTestBasic engineTestBasic)throws Exception {
		engineService.engineBasicAddSubmit(engineTestBasic);
	}
	@RequestMapping("/engineBasicEdit")
	public String engineBasicEdit(Model model,String id)throws Exception {
		model.addAttribute("engineTestBasic", engineService.engineBasicSelectById(id)); 
		return "/engineTest/EngineTestBasic/engineTestBasicEdit";
	}
	@RequestMapping("/engineBasicDel")
	public void engineBasicDel(String id)throws Exception {
		engineService.delEngineBasic(id); 
		
	}
	@RequestMapping("/engineTestBasicList")
	public String engineTestBasicList(Model model)throws Exception {
		EngineTestBasic engineTestBasic= new EngineTestBasic();
		List<EngineTestBasic> engineTestBasiclist =engineService.selectEngineTestBasic(engineTestBasic);
		model.addAttribute("engineTestBasiclist",engineTestBasiclist);
		model.addAttribute("countengineTestBasicList",engineTestBasiclist.size());
		return "/engineTest/EngineTestBasic/engineTestBasic";	
		
	}
	@RequestMapping("/engineTestList")
	public String engineTestList(Model model)throws Exception {
		EngineTest engineTest= new EngineTest();
		List<EngineTest> engineTestlist =engineService.selectEngineTest(engineTest);
		model.addAttribute("engineTestlist",engineTestlist);
		model.addAttribute("countEngineTestlist",engineTestlist.size());
		return "/engineTest/EngineTest/engineTest";	
		
	}
	@RequestMapping("/engineBasicUpdateSubmit")
	public void engineBasicUpdateSubmit(EngineTestBasic engineTestBasic)throws Exception {
		engineService.engineBasicUpdateSubmit(engineTestBasic);	
	}
	@RequestMapping("/engineTestListByEngineId")
	public String engineTestListByEngineId(Model model,String id)throws Exception {
		
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest= new EngineTest();
		engineTest.setEngineId(engineRecordInfo.getEngineId());
		List<EngineTest> engineTestlist =engineService.selectEngineTest(engineTest);	
		model.addAttribute("engineId",engineRecordInfo.getEngineId());
		model.addAttribute("engineTestlist",engineTestlist);
		model.addAttribute("countEngineTestlist",engineTestlist.size());
		return "/engineTest/EngineTest/engineTestFromTest";		
	}
	@RequestMapping("/engineTestInfoAdd")
	public String engineTestInfoAdd(Model model,Integer engineId)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(engineId);
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/EngineTest/engineTestAdd";		
	}
	@RequestMapping("/engineTestAddSubmit")
	public void engineTestAddSubmit(EngineTest engineTest)throws Exception {
		engineService.engineTestAddSubmit(engineTest);
	}
	@RequestMapping("/delEngineTest")
	public void delEngineTest(String id)throws Exception {
		engineService.delEngineTest(id);
	}
	@RequestMapping("/engineTestEdit")
	public String engineTestEdit(Model model,String id)throws Exception {
		EngineTest engineTest = engineService.selectEngineTestById(id);
		model.addAttribute("engineTest", engineTest);
		return "/engineTest/EngineTest/engineTestEdit";
	}
	@RequestMapping("/engineTestEditSubmit")
	public void engineTestEditSubmit(EngineTest engineTest)throws Exception {
		engineService.engineTestEditSubmit(engineTest);
	}
	@RequestMapping("/enginePartsList")
	public String selectEngineParts(Model model)throws Exception {
		EngineParts engineParts= new EngineParts();
		List<EngineParts> enginePartslist =engineService.selectEngineParts(engineParts);
		model.addAttribute("enginePartslist",enginePartslist);
		model.addAttribute("countEnginePartslist",enginePartslist.size());
		return "/engineTest/EngineParts/engineParts";	
		
	}
	@RequestMapping("/enginePartsListByEngineId")
	public String enginePartsListByEngineId(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineParts engineParts= new EngineParts();
		engineParts.setEngineId(engineRecordInfo.getEngineId());
		List<EngineParts> enginePartslist =engineService.selectEngineParts(engineParts);
		model.addAttribute("engineId",engineRecordInfo.getEngineId());
		model.addAttribute("enginePartslist",enginePartslist);
		model.addAttribute("countEnginePartslist",enginePartslist.size());
		return "/engineTest/EngineParts/enginePartsFromTest";		
	}
	@RequestMapping("/enginePartsAdd")
	public String enginePartsAdd(Model model,Integer engineId)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(engineId);
		EngineTest engineTest=new EngineTest();
		if(engineId!=null&&!"".equals(engineId)){
			engineTest.setEngineId(String.valueOf(engineId));
		}
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		model.addAttribute("engineTestList", engineTestList);
		return "/engineTest/EngineParts/enginePartsAdd";		
	}
	@RequestMapping("/enginePartsAddSubmit")
	public void enginePartsAddSubmit(EngineParts engineParts)throws Exception {
		engineService.enginePartsAddSubmit(engineParts);
	}
	@RequestMapping("/delEngineParts")
	public void delEngineParts(String id)throws Exception {
		engineService.delEngineParts(id);
	}
	@RequestMapping("/enginePartsEdit")
	public String enginePartsEdit(Model model,String id)throws Exception {
		EngineParts engineParts = engineService.selectEnginePartsById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(engineParts.getEngineId());
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineParts", engineParts);
		return "/engineTest/EngineParts/enginePartsEdit";
	}
	@RequestMapping("/enginePartsEditSubmit")
	public void enginePartsEditSubmit(EngineParts engineParts)throws Exception {
		engineService.enginePartsEditSubmit(engineParts);
	}
	@RequestMapping("/cylinderPressureListFromTest")
	public String cylinderPressureList(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		CylinderPressure cylinderPressure=new CylinderPressure();
		cylinderPressure.setEngineName(engineRecordInfo.getEngineName());
		List<CylinderPressure> cylinderPressureList = engineService.selectCylinderPressure(cylinderPressure);
		model.addAttribute("id", id);
		model.addAttribute("engineName", engineRecordInfo.getEngineName());
		model.addAttribute("cylinderPressureList", cylinderPressureList);
		model.addAttribute("countCylinderPressureList", cylinderPressureList.size());
		return "/engineTest/CylinderPressure/cylinderPressureFromTest";
	}
	@RequestMapping("/cylinderPressureList")
	public String cylinderPressureList(Model model,CylinderPressure cylinderPressure)throws Exception {
		List<CylinderPressure> cylinderPressureList = engineService.selectCylinderPressure(cylinderPressure);
		/*String engineName=cylinderPressureList.get(0).getEngineName();
		model.addAttribute("engineName", engineName);*/
		model.addAttribute("cylinderPressureList", cylinderPressureList);
		model.addAttribute("countCylinderPressureList", cylinderPressureList.size());
		return "/engineTest/Measurement/cylinderPressure";
	}
	@RequestMapping("/cylinderPressureEdit")
	public String cylinderPressureEdit(Model model,String id)throws Exception {
		CylinderPressure cylinderPressure = engineService.selectCylinderPressureById(id);
		model.addAttribute("cylinderPressure", cylinderPressure);
		return "/engineTest/Measurement/cylinderPressureEdit";
	}
	@RequestMapping("/delCylinderPressure")
	public void delCylinderPressure(String id)throws Exception {
		engineService.delCylinderPressure(id);	
	}
	@RequestMapping("/cylinderPressureAdd")
	public String cylinderPressureAdd(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(String.valueOf(engineRecordInfo.getEngineId()));
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/Measurement/cylinderPressureAdd";
	}
	@RequestMapping("/cylinderPressureAddSubmit")
	public void cylinderPressureAddSubmit(CylinderPressure cylinderPressure,String engineRecordInfoId)throws Exception {
		EngineRecordInfo engineRecordInfo =new EngineRecordInfo();
		engineRecordInfo.setId(Integer.parseInt(engineRecordInfoId));
		String results=cylinderPressure.getResults();
		if(results!=null&&!"".equals(results)){
			if(results.equals("on")){
				cylinderPressure.setResults("OK");
				engineRecordInfo.setCylPressure("OK");
				engineService.engineRecordInfoUpdate(engineRecordInfo);
			}	
		}else{
			cylinderPressure.setResults("NOK");
			engineRecordInfo.setCylPressure("NOK");
			engineService.engineRecordInfoUpdate(engineRecordInfo);
		}
		engineService.cylinderPressureAddSubmit(cylinderPressure);
	}
	@RequestMapping("/oilConsumptionList")
	public String oilConsumptionList(Model model,OilConsumption oilConsumption)throws Exception {
		List<OilConsumption> oilConsumptionlist = engineService.selectOilConsumption(oilConsumption);
		/*String engineName=oilConsumptionlist.get(0).getEngineName();
		model.addAttribute("engineName", engineName);*/
		model.addAttribute("oilConsumptionlist", oilConsumptionlist);
		model.addAttribute("countOilConsumptionlist", oilConsumptionlist.size());
		return "/engineTest/Measurement/oilConsumption";
	}
	@RequestMapping("/oilConsumptionEdit")
	public String oilConsumptionEdit(Model model,String id)throws Exception {
		OilConsumption oilConsumption = engineService.selectOilConsumptionById(id);
		model.addAttribute("oilConsumption", oilConsumption);
		return "/engineTest/Measurement/oilConsumptionEdit";
	}
	@RequestMapping("/delOilConsumption")
	public void delOilConsumption(String id)throws Exception {
		engineService.delOilConsumption(id);	
	}
	@RequestMapping("/oilConsumptionListFromTest")
	public String oilConsumptionListFromTest(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		OilConsumption oilConsumption=new OilConsumption();
		oilConsumption.setEngineName(engineRecordInfo.getEngineName());
		List<OilConsumption> oilConsumptionlist = engineService.selectOilConsumption(oilConsumption);
		model.addAttribute("id", id);
		model.addAttribute("engineName", engineRecordInfo.getEngineName());
		model.addAttribute("oilConsumptionlist", oilConsumptionlist);
		model.addAttribute("countOilConsumptionlist", oilConsumptionlist.size());
		return "/engineTest/OilConsumption/oilConsumptionFromTest";
	}
	@RequestMapping("/oilConsumptionAdd")
	public String oilConsumptionAdd(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(String.valueOf(engineRecordInfo.getEngineId()));
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/OilConsumption/oilConsumptionAdd";
	}
	@RequestMapping("/oilConsumptionAddSubmit")
	public void oilConsumptionAddSubmit(OilConsumption oilConsumption,String engineRecordInfoId)throws Exception {
		EngineRecordInfo engineRecordInfo =new EngineRecordInfo();
		engineRecordInfo.setId(Integer.parseInt(engineRecordInfoId));
		engineRecordInfo.setOilConsume("OK");
		engineService.engineRecordInfoUpdate(engineRecordInfo);
		engineService.oilConsumptionAddSubmit(oilConsumption);
	}
	@RequestMapping("/turboChargerVoltageList")
	public String turboChargerVoltageList(Model model,TurboChargerVoltage turboChargerVoltage)throws Exception {
		 List<TurboChargerVoltage> turboChargerVoltageList = engineService.selectTurboChargerVoltage(turboChargerVoltage);
		/*String engineName=oilConsumptionlist.get(0).getEngineName();
		model.addAttribute("engineName", engineName);*/
		model.addAttribute("turboChargerVoltageList", turboChargerVoltageList);
		model.addAttribute("countTurboChargerVoltageList", turboChargerVoltageList.size());
		return "/engineTest/Measurement/TurboChargerVoltage/turboChargerVoltage";
	}
	@RequestMapping("/turboChargerVoltageEdit")
	public String turboChargerVoltageEdit(Model model,String id)throws Exception {
		TurboChargerVoltage turboChargerVoltage = engineService.selectTurboChargerVoltageById(id);
		model.addAttribute("turboChargerVoltage", turboChargerVoltage);
		return "/engineTest/Measurement/TurboChargerVoltage/turboChargerVoltageEdit";
	}
	@RequestMapping("/delTurboChargerVoltage")
	public void delTurboChargerVoltage(String id)throws Exception {
		engineService.delTurboChargerVoltage(id);	
	}
	@RequestMapping("/turboChargerVoltageListFromTest")
	public String turboChargerVoltageListFromTest(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		TurboChargerVoltage turboChargerVoltage=new TurboChargerVoltage();
		turboChargerVoltage.setEngineName(engineRecordInfo.getEngineName());
		List<TurboChargerVoltage> turboChargerVoltageList = engineService.selectTurboChargerVoltage(turboChargerVoltage);
		
		model.addAttribute("id", id);
		model.addAttribute("engineName", engineRecordInfo.getEngineName());
		model.addAttribute("turboChargerVoltageList", turboChargerVoltageList);
		model.addAttribute("countTurboChargerVoltageList", turboChargerVoltageList.size());
		return "/engineTest/Measurement/TurboChargerVoltage/turboChargerVoltageFromTest";
	}
	@RequestMapping("/turboChargerVoltageAdd")
	public String turboChargerVoltageAdd(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(String.valueOf(engineRecordInfo.getEngineId()));
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/Measurement/TurboChargerVoltage/turboChargerVoltageAdd";
	}
	@RequestMapping("/turboChargerVoltageSubmit")
	public void turboChargerVoltageSubmit(TurboChargerVoltage turboChargerVoltage,String engineRecordInfoId)throws Exception {
		EngineRecordInfo engineRecordInfo =new EngineRecordInfo();
		engineRecordInfo.setId(Integer.parseInt(engineRecordInfoId));
		engineRecordInfo.setSuperchargerMeasure("OK");
		engineService.engineRecordInfoUpdate(engineRecordInfo);
		engineService.turboChargerVoltageAddSubmit(turboChargerVoltage);
	}
	@RequestMapping("/nitrogenLeakageList")
	public String nitrogenLeakageList(Model model,NitrogenLeakage nitrogenLeakage)throws Exception {
		List<NitrogenLeakage> nitrogenLeakageList = engineService.selectNitrogenLeakage(nitrogenLeakage);
		
		model.addAttribute("nitrogenLeakageList", nitrogenLeakageList);
		model.addAttribute("countNitrogenLeakageListList", nitrogenLeakageList.size());
		return "/engineTest/Measurement/NitrogenLeakage/nitrogenLeakage";
	}
	@RequestMapping("/nitrogenLeakageEdit")
	public String nitrogenLeakageEdit(Model model,String id)throws Exception {
		NitrogenLeakage nitrogenLeakage = engineService.selectNitrogenLeakageById(id);
		model.addAttribute("nitrogenLeakage", nitrogenLeakage);
		return "/engineTest/Measurement/NitrogenLeakage/nitrogenLeakageEdit";
	}
	@RequestMapping("/delNitrogenLeakage")
	public void delNitrogenLeakage(String id)throws Exception {
		engineService.delnitrogenLeakage(id);
	}
	@RequestMapping("/nitrogenLeakageListFromTest")
	public String nitrogenLeakageListFromTest(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		NitrogenLeakage nitrogenLeakage=new NitrogenLeakage();
		nitrogenLeakage.setEngineName(engineRecordInfo.getEngineName());
		List<NitrogenLeakage> nitrogenLeakageList = engineService.selectNitrogenLeakage(nitrogenLeakage);
		model.addAttribute("id", id);
		model.addAttribute("engineName", engineRecordInfo.getEngineName());
		model.addAttribute("nitrogenLeakageList", nitrogenLeakageList);
		model.addAttribute("countnNitrogenLeakageList", nitrogenLeakageList.size());
		return "/engineTest/Measurement/NitrogenLeakage/nitrogenLeakageFromTest";
	}
	@RequestMapping("/nitrogenLeakageAdd")
	public String nitrogenLeakageAdd(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(String.valueOf(engineRecordInfo.getEngineId()));
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/Measurement/NitrogenLeakage/nitrogenLeakageAdd";
	}
	@RequestMapping("/nitrogenLeakageSubmit")
	public void nitrogenLeakageSubmit(NitrogenLeakage nitrogenLeakage,String engineRecordInfoId)throws Exception {
		EngineRecordInfo engineRecordInfo =new EngineRecordInfo();
		engineRecordInfo.setId(Integer.parseInt(engineRecordInfoId));
		
		boolean a=nitrogenLeakage.getCylinder1Status()!=null&&!"".equals(nitrogenLeakage.getCylinder1Status());
		boolean b=nitrogenLeakage.getCylinder2Status()!=null&&!"".equals(nitrogenLeakage.getCylinder2Status());
		boolean c=nitrogenLeakage.getCylinder3Status()!=null&&!"".equals(nitrogenLeakage.getCylinder3Status());
		boolean d=nitrogenLeakage.getCylinder4Status()!=null&&!"".equals(nitrogenLeakage.getCylinder4Status());
		if(a&&b&&c&&d){
			engineRecordInfo.setNitrogenLeak("OK");
			engineService.engineRecordInfoUpdate(engineRecordInfo);
		}
		
		engineService.nitrogenLeakageAddSubmit(nitrogenLeakage);
	}
	@RequestMapping("/oilPressureList")
	public String oilPressureList(Model model,OilPressure oilPressure)throws Exception {
		List<OilPressure> oilPressureList = engineService.selectOilPressure(oilPressure);
		model.addAttribute("oilPressureList", oilPressureList);
		model.addAttribute("countOilPressureList", oilPressureList.size());
		return "/engineTest/Measurement/OilPressure/oilPressure";
	}
	@RequestMapping("/oilPressureEdit")
	public String oilPressureEdit(Model model,String engineName,String testName)throws Exception {
		OilPressure oilPressure=new OilPressure();
		oilPressure.setEngineName(engineName);
		oilPressure.setTestName(testName);
		List<OilPressure> oilPressureList = engineService.selectOilPressureByEngineNameAndTestname(oilPressure);
		OilPressure oilPressure0=oilPressureList.get(0);
		model.addAttribute("oilPressure", oilPressure0);
		model.addAttribute("oilPressureList", oilPressureList);
		model.addAttribute("countOilPressureList", oilPressureList.size());
		return "/engineTest/Measurement/OilPressure/oilPressureEdit";
	}
	@RequestMapping("/delOilPressure")
	public void delOilPressure(String id)throws Exception {
		engineService.delOilPressure(id);
	}
	@RequestMapping("/delOilPressureAllEngineName")
	public void delOilPressureAllEngineName(String id)throws Exception {
		OilPressure oilPressure =engineService.selectOilPressureByid(id);
		engineService.delOilPressureAllEngineName(oilPressure.getEngineName());
	}
	@RequestMapping("/oilPressureListFromTest")
	public String oilPressureListFromTest(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		OilPressure oilPressure=new OilPressure();
		oilPressure.setEngineName(engineRecordInfo.getEngineName());
		List<OilPressure> oilPressureList = engineService.selectOilPressureByEngineName(engineRecordInfo.getEngineName());
		model.addAttribute("id", id);
		model.addAttribute("engineName", engineRecordInfo.getEngineName());
		model.addAttribute("oilPressureList", oilPressureList);
		model.addAttribute("countnOilPressureList", oilPressureList.size());
		return "/engineTest/Measurement/OilPressure/oilPressureFromTest";
	}
	@RequestMapping("/oilPressureAdd")
	public String oilPressureAdd(Model model,String id)throws Exception {
		EngineRecordInfo engineRecordInfo = engineService.selectEngineRecordInfoById(id);
		EngineTest engineTest=new EngineTest();
		engineTest.setEngineId(String.valueOf(engineRecordInfo.getEngineId()));
		List<EngineTest> engineTestList = engineService.selectEngineTest(engineTest);
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser user = (ActiveUser) subject.getPrincipal();
		String username = user.getUsername();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		model.addAttribute("username", username);
		model.addAttribute("time", df.format(new Date()));
		model.addAttribute("engineTestList", engineTestList);
		model.addAttribute("engineRecordInfo", engineRecordInfo);
		return "/engineTest/Measurement/OilPressure/oilPressureAdd";
	}
	@RequestMapping("/oilPressureSubmit")
	public void oilPressureSubmit(OilPressure oilPressure,String engineRecordInfoId)throws Exception {
		EngineRecordInfo engineRecordInfo =new EngineRecordInfo();
		engineRecordInfo.setId(Integer.parseInt(engineRecordInfoId));
		engineRecordInfo.setOilPressure("OK");;
		engineService.engineRecordInfoUpdate(engineRecordInfo);
		List<OilPressureTurboActuator> OilPressureTurboActuatorList= engineService.selectoilPressureTurboActuatorList();
		for(int i=0;i<OilPressureTurboActuatorList.size();i++){
			OilPressure oilPressurenew =new OilPressure();
			oilPressurenew.setOilPressureTime(oilPressure.getOilPressureTime());
			oilPressurenew.setOperator(oilPressure.getOperator());
			oilPressurenew.setCycleTime(oilPressure.getCycleTime());
			oilPressurenew.setTotalTime(oilPressure.getTotalTime());
			oilPressurenew.setTestName(oilPressure.getTestName());
			oilPressurenew.setMaintenanceTpye(oilPressure.getMaintenanceTpye());
			oilPressurenew.setEngineId(oilPressure.getEngineId());
			oilPressurenew.setEngineName(oilPressure.getEngineName());
			oilPressurenew.setLocationName(oilPressure.getLocationName());
			oilPressurenew.setMotorDrehzahl(OilPressureTurboActuatorList.get(i).getMotorDrehzahl());
			oilPressurenew.setDrosselklapp(OilPressureTurboActuatorList.get(i).getDrosselklapp());
			oilPressurenew.setOldruckBeimMax(OilPressureTurboActuatorList.get(i).getOldruckBeimMax());
			oilPressurenew.setOldruckBeimMin(OilPressureTurboActuatorList.get(i).getOldruckBeimMin());
			oilPressurenew.setOldruckInKobenMax(OilPressureTurboActuatorList.get(i).getOldruckInKobenMax());
			oilPressurenew.setOldruckInKobenMin(OilPressureTurboActuatorList.get(i).getOldruckInKobenMin());
			engineService.oilPressureAddSubmit(oilPressurenew);
		}
		
	}
	@RequestMapping("/oilPressureEditEditById")
	public String oilPressureEditEditById(Model model,String id)throws Exception {
		OilPressure oilPressure = engineService.selectOilPressureByid(id);
		model.addAttribute("oilPressure", oilPressure);
		return "/engineTest/Measurement/OilPressure/oilPressureEditEdit";
	}
	@RequestMapping("/oilPressureUpdate")
	public void oilPressureUpdate(OilPressure oilPressure)throws Exception {
		 engineService.oilPressureUpdate(oilPressure);
		
	}
}

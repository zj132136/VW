package com.vw.engine.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import com.vw.engine.mapper.EngineMapper;
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

public class EngineServiceImpl implements EngineService {
	@Autowired
	private EngineMapper engineMapper;

	@Override
	public List<engines_location> selectEngines_location() throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineLocation();
	}

	@Override
	public engines_location selectEngines_locationById(Integer location_id)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineLocationById(location_id);
	}

	@Override
	public void engineLocationEditSubmit(engines_location engineslocation)
			throws Exception {
		engineMapper.engineLocationEditSubmit(engineslocation);
		
	}

	@Override
	public void engineLocationAddSubmit(engines_location engineslocation)
			throws Exception {
		engineMapper.engineLocationAddSubmit(engineslocation);
		
	}

	@Override
	public void delEngineLocation(Integer id) throws Exception {
		engineMapper.delEngineLocation(id);
		
	}

	@Override
	public Map<String,Object> selectEngineRecordInfo(String page,String rows,EngineRecordInfo engineRecordinfo) throws Exception {
		int currentPage = 1;
		int pageSize = 5;
		if(page!=null){
			currentPage = Integer.parseInt(page);
		}
		if(rows!=null){
			pageSize= Integer.parseInt(rows);
		}
		RowBounds rowBounds = new RowBounds((currentPage-1)*pageSize,pageSize);
		
		List<EngineRecordInfo> testList =  engineMapper.selectEngineRecordInfo(engineRecordinfo,rowBounds);
		int count = engineMapper.countEngineRecordInfo(engineRecordinfo);
		
		Map<String, Object> map = new HashMap<String,Object>();
		int total =count/pageSize +1;
		map.put("total", total);
		map.put("records", count);
		map.put("page", currentPage);
		map.put("users", testList);
		return map;
	}

	@Override
	public Map<String, Object> engineLocationlistJson(String page,String rows,Engine engine) throws Exception {
		
		List<Engine> engineList = engineMapper.selectEngine(engine);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("redirect", "");
		map.put("code", "200");
		map.put("message", "");
		map.put("value", engineList);
		return map;
	}

	@Override
	public List<Engine> selectEngine(Engine engine) throws Exception {
		return engineMapper.selectEngine(engine);
	}

	@Override
	public Engine selectEngineById(Integer id) throws Exception {
		return engineMapper.selectEngineById(id);
	}

	@Override
	public void delEngine(Integer id) throws Exception {
		engineMapper.delEngine(id);
		
	}
	@Override
	public void engineEditSubmit(Engine engine)
			throws Exception {
		engineMapper.engineEditSubmit(engine);
		
	}
	@Override
	public void engineAddSubmit(Engine engine)
			throws Exception {
		engineMapper.engineAddSubmit(engine);
		
	}

	@Override
	public List<String> selectEngineName() throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineName();
	}

	@Override
	public void engineRecordInfoAddSubmit(EngineRecordInfo engineRecordInfo)
			throws Exception {
		if(engineRecordInfo.getEngineBasicInfo()==null||"".equals(engineRecordInfo.getEngineBasicInfo())){
			engineRecordInfo.setEngineBasicInfo("装机信息");
		}
		if(engineRecordInfo.getEngineTestInfo()==null||"".equals(engineRecordInfo.getEngineTestInfo())){
			engineRecordInfo.setEngineTestInfo("暂无");
		}
		if(engineRecordInfo.getEngineParts()==null||"".equals(engineRecordInfo.getEngineParts())){
			engineRecordInfo.setEngineParts("暂无");
		}
		if(engineRecordInfo.getOilConsume()==null||"".equals(engineRecordInfo.getOilConsume())){
			engineRecordInfo.setOilConsume("暂无");
		}
		if(engineRecordInfo.getOilPressure()==null||"".equals(engineRecordInfo.getOilPressure())){
			engineRecordInfo.setOilPressure("暂无");
		}
		if(engineRecordInfo.getCylPressure()==null||"".equals(engineRecordInfo.getCylPressure())){
			engineRecordInfo.setCylPressure("暂无");
		}
		if(engineRecordInfo.getNitrogenLeak()==null||"".equals(engineRecordInfo.getNitrogenLeak())){
			engineRecordInfo.setNitrogenLeak("暂无");
		}
		if(engineRecordInfo.getSuperchargerMeasure()==null||"".equals(engineRecordInfo.getSuperchargerMeasure())){
			engineRecordInfo.setSuperchargerMeasure("暂无");
		}
		engineMapper.engineRecordInfoAddSubmit(engineRecordInfo);
		
	}

	@Override
	public List<EngineTestBasic> selectEngineTestBasic(
			EngineTestBasic engineTestBasic) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineTestBasic(engineTestBasic);
	}

	@Override
	public EngineRecordInfo selectEngineRecordInfoById(Integer id)
			throws Exception {
		return engineMapper.selectEngineRecordInfoById(id);
	}

	@Override
	public void engineBasicAddSubmit(EngineTestBasic engineTestBasic)
			throws Exception {
		engineMapper.engineBasicAddSubmit(engineTestBasic);
		
	}

	@Override
	public EngineTestBasic engineBasicSelectById(String id) throws Exception {
		return engineMapper.engineBasicSelectById(id);	
	}

	@Override
	public void delEngineBasic(String id) throws Exception {
		engineMapper.delEngineBasic(id);
		
	}

	@Override
	public List<EngineTest> selectEngineTest(EngineTest engineTest)
			throws Exception {
		return engineMapper.selectEngineTest(engineTest);
	}

	@Override
	public EngineRecordInfo selectEngineRecordInfoById(String id) throws Exception {
		// TODO Auto-generated method stub
		
		return engineMapper.selectEngineRecordInfoById(Integer.valueOf(id));
	}

	@Override
	public void engineTestAddSubmit(EngineTest engineTest) throws Exception {
		engineMapper.engineTestAddSubmit(engineTest);
	}

	@Override
	public void engineBasicUpdateSubmit(EngineTestBasic engineTestBasic)
			throws Exception {
		engineMapper.engineBasicUpdateSubmit(engineTestBasic);
		
	}

	@Override
	public void delEngineTest(String id) throws Exception {
		engineMapper.delEngineTest(id);
	}

	@Override
	public EngineTest selectEngineTestById(String id) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineTestById(id);
	}

	@Override
	public void engineTestEditSubmit(EngineTest engineTest) throws Exception {
		engineMapper.engineTestEditSubmit(engineTest);
	}

	@Override
	public List<EngineParts> selectEngineParts(EngineParts engineParts)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEngineParts(engineParts);
	}

	@Override
	public void enginePartsAddSubmit(EngineParts engineParts) throws Exception {
		engineMapper.enginePartsAddSubmit(engineParts);
	}

	@Override
	public void delEngineParts(String id) throws Exception {
		engineMapper.delEngineParts(id);
	}

	@Override
	public EngineParts selectEnginePartsById(String id) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectEnginePartsById(id);
	}

	@Override
	public void enginePartsEditSubmit(EngineParts engineParts) throws Exception {
		engineMapper.enginePartsEditSubmit(engineParts);
	}

	@Override
	public List<CylinderPressure> selectCylinderPressure(
			CylinderPressure cylinderPressure) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectCylinderPressure(cylinderPressure);
	}

	@Override
	public CylinderPressure selectCylinderPressureById(String id)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectCylinderPressureById(id);
	}

	@Override
	public void delCylinderPressure(String id) throws Exception {
		engineMapper.delCylinderPressure(id);
	}

	@Override
	public void cylinderPressureAddSubmit(CylinderPressure cylinderPressure)
			throws Exception {
		engineMapper.cylinderPressureAddSubmit(cylinderPressure);
	}

	@Override
	public void engineRecordInfoUpdate(EngineRecordInfo engineRecordInfo)
			throws Exception {
		engineMapper.engineRecordInfoUpdate(engineRecordInfo);
	}

	@Override
	public List<OilConsumption> selectOilConsumption(
			OilConsumption oilConsumption) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilConsumption(oilConsumption);
	}

	@Override
	public OilConsumption selectOilConsumptionById(String id) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilConsumptionById(id);
	}

	@Override
	public void delOilConsumption(String id) throws Exception {
		engineMapper.delOilConsumption(id);
	}

	@Override
	public void oilConsumptionAddSubmit(OilConsumption oilConsumption)
			throws Exception {
		engineMapper.oilConsumptionAddSubmit(oilConsumption);
	}

	@Override
	public List<TurboChargerVoltage> selectTurboChargerVoltage(
			TurboChargerVoltage turboChargerVoltage) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectTurboChargerVoltage(turboChargerVoltage);
	}

	@Override
	public TurboChargerVoltage selectTurboChargerVoltageById(String id)
			throws Exception {
		return engineMapper.selectTurboChargerVoltageById(id);
	}

	@Override
	public void delTurboChargerVoltage(String id) throws Exception {
		engineMapper.delTurboChargerVoltage(id);
	}

	@Override
	public void turboChargerVoltageAddSubmit(
			TurboChargerVoltage turboChargerVoltage) throws Exception {
		engineMapper.turboChargerVoltageAddSubmit(turboChargerVoltage);
	}

	@Override
	public List<NitrogenLeakage> selectNitrogenLeakage(
			NitrogenLeakage nitrogenLeakage) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectNitrogenLeakage(nitrogenLeakage);
	}

	@Override
	public NitrogenLeakage selectNitrogenLeakageById(String id)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectNitrogenLeakageById(id);
	}

	@Override
	public void delnitrogenLeakage(String id) throws Exception {
		engineMapper.delnitrogenLeakage(id);
	}

	@Override
	public void nitrogenLeakageAddSubmit(NitrogenLeakage nitrogenLeakage)
			throws Exception {
		engineMapper.nitrogenLeakageAddSubmit(nitrogenLeakage);
	}

	@Override
	public List<OilPressure> selectOilPressure(OilPressure oilPressure)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilPressure(oilPressure);
	}

	@Override
	public List<OilPressure> selectOilPressureByEngineName(String engineName)
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilPressureByEngineName(engineName);
	}

	@Override
	public void delOilPressure(String id) throws Exception {
		engineMapper.delOilPressure(id);
	}

	@Override
	public void delOilPressureAllEngineName(String engineName) throws Exception {
		engineMapper.delOilPressureAllEngineName(engineName);
	}

	@Override
	public OilPressure selectOilPressureByid(String id) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilPressureByid(id);
	}

	@Override
	public List<OilPressureTurboActuator> selectoilPressureTurboActuatorList()
			throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectoilPressureTurboActuatorList();
	}

	@Override
	public void oilPressureAddSubmit(OilPressure oilPressure) throws Exception {
		engineMapper.oilPressureAddSubmit(oilPressure);
	}

	@Override
	public List<OilPressure> selectOilPressureByEngineNameAndTestname(
			OilPressure oilPressure) throws Exception {
		// TODO Auto-generated method stub
		return engineMapper.selectOilPressureByEngineNameAndTestname(oilPressure);
	}

	@Override
	public void oilPressureUpdate(OilPressure oilPressure) throws Exception {
		engineMapper.oilPressureUpdate(oilPressure);
	}

	


}

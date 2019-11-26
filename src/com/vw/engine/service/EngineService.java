package com.vw.engine.service;
import java.util.List;
import java.util.Map;

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
public interface EngineService {
	
	
	public List<engines_location> selectEngines_location()throws Exception;
	public engines_location selectEngines_locationById(Integer location_id)throws Exception;
	public void engineLocationEditSubmit(engines_location engineslocation)throws Exception;
	public void engineLocationAddSubmit(engines_location engineslocation)throws Exception;
	public void delEngineLocation(Integer id)throws Exception;
	
	public Map<String,Object> selectEngineRecordInfo(String page,String rows,EngineRecordInfo engineRecordinfo)throws Exception;
	public void engineRecordInfoAddSubmit(EngineRecordInfo engineRecordInfo)throws Exception;
	public Map<String,Object> engineLocationlistJson(String page,String rows,Engine engine)throws Exception;
	public EngineRecordInfo selectEngineRecordInfoById(String id)throws Exception;
	
	public List<String> selectEngineName()throws Exception;
	public List<Engine> selectEngine(Engine engine)throws Exception;
	public Engine selectEngineById(Integer id)throws Exception;
	public void delEngine(Integer id)throws Exception;
	public void engineEditSubmit(Engine engine)throws Exception;
	public void engineAddSubmit(Engine engine)throws Exception;
	
	//更新测量状态
	public void engineRecordInfoUpdate(EngineRecordInfo engineRecordInfo)throws Exception;
	//基本信息
	public List<EngineTestBasic> selectEngineTestBasic(EngineTestBasic engineTestBasic)throws Exception;
	public EngineRecordInfo selectEngineRecordInfoById(Integer id)throws Exception;
	public void engineBasicAddSubmit(EngineTestBasic engineTestBasic)throws Exception;
	public EngineTestBasic engineBasicSelectById(String id)throws Exception;
	public void delEngineBasic(String id)throws Exception;
	public void engineBasicUpdateSubmit(EngineTestBasic engineTestBasic)throws Exception;
	//试验信息
	public List<EngineTest> selectEngineTest(EngineTest engineTest)throws Exception;
	public void engineTestAddSubmit(EngineTest engineTest)throws Exception;
	public void delEngineTest(String id)throws Exception;
	public EngineTest selectEngineTestById(String id)throws Exception;
	public void engineTestEditSubmit(EngineTest engineTest)throws Exception;
	//零部件
	public List<EngineParts> selectEngineParts(EngineParts engineParts)throws Exception;
	public void enginePartsAddSubmit(EngineParts engineParts)throws Exception;
	public void delEngineParts(String id)throws Exception;
	public EngineParts selectEnginePartsById(String id)throws Exception;
	public void enginePartsEditSubmit(EngineParts engineParts)throws Exception;
	//缸压
	public List<CylinderPressure> selectCylinderPressure(CylinderPressure cylinderPressure)throws Exception;
	public CylinderPressure selectCylinderPressureById(String id)throws Exception;
	public void delCylinderPressure(String id)throws Exception;
	public void cylinderPressureAddSubmit(CylinderPressure cylinderPressure)throws Exception;
	//油耗
	public List<OilConsumption> selectOilConsumption(OilConsumption oilConsumption)throws Exception;
	public OilConsumption selectOilConsumptionById(String id)throws Exception;
	public void delOilConsumption(String id)throws Exception;
	public void oilConsumptionAddSubmit(OilConsumption oilConsumption)throws Exception;
	//turboChargerVoltage
	public List<TurboChargerVoltage> selectTurboChargerVoltage(TurboChargerVoltage turboChargerVoltage)throws Exception;
	public TurboChargerVoltage selectTurboChargerVoltageById(String id)throws Exception;
	public void delTurboChargerVoltage(String id)throws Exception;
	public void turboChargerVoltageAddSubmit(TurboChargerVoltage turboChargerVoltage)throws Exception;
	//氮气泄露
	public List<NitrogenLeakage> selectNitrogenLeakage(NitrogenLeakage nitrogenLeakage)throws Exception;
	public NitrogenLeakage selectNitrogenLeakageById(String id)throws Exception;
	public void delnitrogenLeakage(String id)throws Exception;
	public void nitrogenLeakageAddSubmit(NitrogenLeakage nitrogenLeakage)throws Exception;
	//油压
	public List<OilPressure> selectOilPressure(OilPressure oilPressure)throws Exception;
	public List<OilPressure> selectOilPressureByEngineName(String engineName)throws Exception;
	public List<OilPressure> selectOilPressureByEngineNameAndTestname(OilPressure oilPressure)throws Exception;
	public OilPressure selectOilPressureByid(String id)throws Exception;
	public void delOilPressure(String id)throws Exception;
	public void delOilPressureAllEngineName(String engineName)throws Exception;
	public List<OilPressureTurboActuator> selectoilPressureTurboActuatorList()throws Exception;
	public void oilPressureAddSubmit(OilPressure oilPressure)throws Exception;
	public void oilPressureUpdate(OilPressure oilPressure)throws Exception;
	
}

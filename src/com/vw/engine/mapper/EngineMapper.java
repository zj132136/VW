package com.vw.engine.mapper;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

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
public interface EngineMapper {
	List<engines_location> selectEngineLocation();
	engines_location selectEngineLocationById(Integer location_id);
	void engineLocationEditSubmit(engines_location engineslocation);
	void engineLocationAddSubmit(engines_location engineslocation);
	void delEngineLocation(Integer id);
	
	List<Engine> selectEngine(Engine engine);
	Engine selectEngineById(Integer id);
	void delEngine(Integer id);
	void engineEditSubmit(Engine engine);
	void engineAddSubmit(Engine engine);
	List<String> selectEngineName();
	
	List<EngineRecordInfo> selectEngineRecordInfo(EngineRecordInfo engineRecordinfo,RowBounds rowBounds);
	int countEngineRecordInfo(EngineRecordInfo engineRecordinfo);
	void engineRecordInfoAddSubmit(EngineRecordInfo engineRecordinfo);
	EngineRecordInfo selectEngineRecordInfoById(Integer id);
	void engineRecordInfoUpdate(EngineRecordInfo engineRecordInfo);
	List<EngineTestBasic> selectEngineTestBasic(EngineTestBasic engineTestBasic);
	
	void engineBasicAddSubmit(EngineTestBasic engineTestBasic);
	EngineTestBasic engineBasicSelectById(String id);
	void delEngineBasic(String id);
	void engineBasicUpdateSubmit(EngineTestBasic engineTestBasic);
	//试验信息
	List<EngineTest> selectEngineTest(EngineTest engineTest);
	void engineTestAddSubmit(EngineTest engineTest);
	void delEngineTest(String id);
	EngineTest selectEngineTestById(String id);
	void engineTestEditSubmit(EngineTest engineTest);
	//零部件
	List<EngineParts> selectEngineParts(EngineParts engineParts);
	void enginePartsAddSubmit(EngineParts engineParts);
	void delEngineParts(String id);
	EngineParts selectEnginePartsById(String id);
	void enginePartsEditSubmit(EngineParts engineParts);
	//缸压
	List<CylinderPressure> selectCylinderPressure(CylinderPressure cylinderPressure);
	CylinderPressure selectCylinderPressureById(String id);
	void delCylinderPressure(String id);
	void cylinderPressureAddSubmit(CylinderPressure cylinderPressure);
	//油耗
	List<OilConsumption> selectOilConsumption(OilConsumption oilConsumption);
	OilConsumption selectOilConsumptionById(String id);
	void delOilConsumption(String id);
	void oilConsumptionAddSubmit(OilConsumption oilConsumption);
	//TurboChargerVoltage
	List<TurboChargerVoltage> selectTurboChargerVoltage(TurboChargerVoltage turboChargerVoltage);
	TurboChargerVoltage selectTurboChargerVoltageById(String id);
	void delTurboChargerVoltage(String id);
	void turboChargerVoltageAddSubmit(TurboChargerVoltage turboChargerVoltage);
	//氮气泄露
	List<NitrogenLeakage> selectNitrogenLeakage(NitrogenLeakage nitrogenLeakage);
	NitrogenLeakage selectNitrogenLeakageById(String id);
	void delnitrogenLeakage(String id);
	void nitrogenLeakageAddSubmit(NitrogenLeakage nitrogenLeakage);
	//油压
	List<OilPressure> selectOilPressure(OilPressure oilPressure);
	List<OilPressure> selectOilPressureByEngineName(String engineName);
	OilPressure selectOilPressureByid(String id);
	void delOilPressure(String id);
	void delOilPressureAllEngineName(String engineName);
	List<OilPressureTurboActuator> selectoilPressureTurboActuatorList();
	void oilPressureAddSubmit(OilPressure oilPressure);
	List<OilPressure> selectOilPressureByEngineNameAndTestname(OilPressure oilPressure);
	void oilPressureUpdate(OilPressure oilPressure)throws Exception;
}

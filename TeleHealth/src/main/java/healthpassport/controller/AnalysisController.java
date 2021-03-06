package healthpassport.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import healthpassport.model.BMIBean;
import healthpassport.model.BMIService;
import healthpassport.model.BloodPressureBean;
import healthpassport.model.BloodPressureService;
import healthpassport.model.BloodSugarBean;
import healthpassport.model.BloodSugarService;
import healthpassport.model.DataAnalysisBean;
import healthpassport.model.DataAnalysisService;

@Controller
public class AnalysisController {
	@Autowired
	private BMIService bmiService;
	@Autowired
	private BloodPressureService bloodPressureService;
	@Autowired
	private BloodSugarService BloodSugarService;
	@Autowired
	private DataAnalysisService DataAnalysisService;
	// BMI
	@RequestMapping(path = { "/healthpassport/querybmi.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	// String gender,String age
	public @ResponseBody String queryBMI(String memberid, String height, String weight, String bmi,String gender,String age, Model model) {
		try {
			Double heightResult = Double.parseDouble(height);
			Double weightResult = Double.parseDouble(weight);
			Double bmiResult = Double.parseDouble(bmi);
			Integer Age =Integer.parseInt(age);
			BMIBean bean = new BMIBean();
			bean.setMemberid(memberid);
			bean.setBmi(bmiResult);
			bean.setHeight(heightResult);
			bean.setWeight(weightResult);
			BMIBean result = bmiService.insert(bean, gender, Age);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			HashMap<String, String> dataOne = new HashMap<String, String>();
			Double returnheight = Math.floor(heightResult); // 取整數
			Double returnweight = Math.floor(weightResult); // 取整數
			String strheight = returnheight.toString();
			String strweight = returnweight.toString();
			String strbmi = bmiResult.toString();
			String stresult = result.getResult();
			String strtime = sdf.format(result.getCreateTime()).toString();
			dataOne.put("hei", strheight);
			dataOne.put("wei", strweight);
			dataOne.put("bmi", strbmi);
			dataOne.put("bmiresult", stresult);
			dataOne.put("time", strtime);
			String data = new Gson().toJson(dataOne);
			return data;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(path = { "/healthpassport/bmirecords.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bmiRecords(String memberid) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BMIBean> result = bmiService.selectMemberid(memberid);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String height = result.get(i).getHeight().toString();
			String weight = result.get(i).getWeight().toString();
			String bmi = result.get(i).getBmi().toString();
			String bmiResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("height", height);
			dataOne.put("weight", weight);
			dataOne.put("bmi", bmi);
			dataOne.put("bmiResult", bmiResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	@RequestMapping(path = { "/healthpassport/bmitopRecord.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String newOneRecords(String memberid) {
		BMIBean bean = new BMIBean();
		bean.setMemberid(memberid);
		BMIBean result = bmiService.newOne(memberid);
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		HashMap<String, String> dataOne = new HashMap<String, String>();
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(result==null){
			return null;			
		}
		Double getheight = result.getHeight();
		Double getweight = result.getWeight();
		Double heightChangeInt = new Double(getheight);
		Double weightChangeInt = new Double(getweight);
		Integer h = heightChangeInt.intValue();
		Integer w = weightChangeInt.intValue();
		String height = h.toString();
		String weight = w.toString();
		String bmi = result.getBmi().toString();
		String result1 = result.getResult();
		String time = sdf.format(result.getCreateTime());
		dataOne.put("h", height);
		dataOne.put("w", weight);
		dataOne.put("b", bmi);
		dataOne.put("rs", result1);
		dataOne.put("t", time);
		datafinal.add(dataOne);
		datas.put("topbmi", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 血壓
	@RequestMapping(path = { "/healthpassport/queryBloodPressure.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String queryBloodPressure(String memberid, String systoleData, String diastoleData,
			String heartBeatData,String gender,String age,Model model) {
		try {
			// client傳進值
			Integer systoleD = Integer.parseInt(systoleData);
			Integer diastoleD = Integer.parseInt(diastoleData);
			Integer heartBeatD = Integer.parseInt(heartBeatData);
			Integer Age =Integer.parseInt(age);
			BloodPressureBean bean = new BloodPressureBean();
			bean.setMemberid(memberid);
			bean.setMaxBloodPressure(systoleD);
			bean.setMinBloodPressure(diastoleD);
			bean.setHeartBeat(heartBeatD);
			BloodPressureBean bpresult = bloodPressureService.insert(bean,gender,Age);			
			String data = new Gson().toJson(bpresult);
			return data;

		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}

	// 查詢血壓紀錄
	@RequestMapping(path = { "/healthpassport/bloodPressureRecords.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bpRecords(String memberid,String gender,String age) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodPressureBean> result = bloodPressureService.selectMemberid(memberid);
		Integer ageint = 0;
		try {			
			ageint = Integer.parseInt(age);
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
				DataAnalysisBean Diastole = DataAnalysisService.selectGroupId("BloodPressureDiastole", gender, ageint);//標準數值
				DataAnalysisBean Systole = DataAnalysisService.selectGroupId("BloodPressureSystole", gender, ageint);
				dataOne.put("diastolecheckmax", String.valueOf(Diastole.getMaxvalue()));
				dataOne.put("diastolecheckmin",String.valueOf(Diastole.getMinvalue()));
				dataOne.put("systolecheckmin",String.valueOf(Systole.getMinvalue()));
				dataOne.put("systolecheckmax",String.valueOf(Systole.getMaxvalue()));
				String systole = result.get(i).getMaxBloodPressure().toString();
				String diastole = result.get(i).getMinBloodPressure().toString();
				String heartBeat = result.get(i).getHeartBeat().toString();
				String bpResult = result.get(i).getResult();
				String createTime = sdf.format(result.get(i).getCreateTime());
				dataOne.put("systole", systole);
				dataOne.put("diastole", diastole);
				dataOne.put("heartBeat", heartBeat);
				dataOne.put("bpResult", bpResult);
				dataOne.put("createTime", createTime);
				datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 當網頁開啟給予上次資料
	@RequestMapping(path = { "/healthpassport/bptopRecord.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bpnewOneRecords(String memberid) {
		BloodPressureBean bean = new BloodPressureBean();
		bean.setMemberid(memberid);
		BloodPressureBean result = bloodPressureService.newOne(memberid);
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		HashMap<String, String> dataOne = new HashMap<String, String>();
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(result==null){
			return null;			
		}
		String getmaxbp = result.getMaxBloodPressure().toString();
		String getminbp = result.getMinBloodPressure().toString();
		String gethb = result.getHeartBeat().toString();
		String getresult = result.getResult();
		String time = sdf.format(result.getCreateTime());
		dataOne.put("maxbp", getmaxbp);
		dataOne.put("minbp", getminbp);
		dataOne.put("hb", gethb);
		dataOne.put("rs", getresult);
		dataOne.put("t", time);
		datafinal.add(dataOne);
		datas.put("topbp", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}


	@RequestMapping(path = { "/healthpassport/queryBloodSugar.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String queryBloodSugar(String memberid, String bloodsugar,
					String gender,String age,Model model) {
		// clinet端值
		try {
			if(bloodsugar==null || bloodsugar.trim().length()==0) {
				return null;
			}
			Integer bSugar = Integer.parseInt(bloodsugar);			
			Integer Age =Integer.parseInt(age);
			BloodSugarBean bean = new BloodSugarBean();
			bean.setMemberId(memberid);
			bean.setBloodSugar(bSugar);
			BloodSugarBean result = BloodSugarService.insert(bean, gender, Age);
			String bloodsugarresult = new Gson().toJson(result);
			return bloodsugarresult;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(path = { "/healthpassport/bloodSugarRecords.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bsRecords(String memberid,String gender,String age) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodSugarBean> result = BloodSugarService.selectMemberid(memberid);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			DataAnalysisBean Bsdata = DataAnalysisService.selectdataBs(gender);
			dataOne.put("bloodSugarmin", String.valueOf(Bsdata.getMinvalue()));
			dataOne.put("bloodSugarmax", String.valueOf(Bsdata.getMaxvalue()));
			String bloodSugar = result.get(i).getBloodSugar().toString();
			String bsResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("bloodSugar", bloodSugar);
			dataOne.put("bsResult", bsResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	@RequestMapping(path = { "/healthpassport/bstopRecord.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bsnewOneRecords(String memberid) {
		BloodSugarBean bean = new BloodSugarBean();
		bean.setMemberId(memberid);
		BloodSugarBean result = BloodSugarService.newOne(memberid);
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		HashMap<String, String> dataOne = new HashMap<String, String>();
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String getbs=null;
		String getbsresult = null;
		String time = null;
		if(result==null) {
			getbs = "";
			getbsresult ="";
			time ="";
		}else {
			getbs = result.getBloodSugar().toString();
			getbsresult = result.getResult();
			time = sdf.format(result.getCreateTime());
		}
		
		dataOne.put("getbs", getbs);
		dataOne.put("getbsresult", getbsresult);
		dataOne.put("t", time);
		datafinal.add(dataOne);
		datas.put("topbs", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 7血糖
	@RequestMapping(path = { "/healthpassport/bloodSugarRecordsseven.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bsRecordsseven(String memberid,String gender) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodSugarBean> result = BloodSugarService.selectMemberidseven(memberid);
		DataAnalysisBean Bsdata = DataAnalysisService.selectdataBs(gender);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String bloodSugar = result.get(i).getBloodSugar().toString();
			String bsResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("bloodSugarmin", String.valueOf(Bsdata.getMinvalue()));
			dataOne.put("bloodSugarmax", String.valueOf(Bsdata.getMaxvalue()));
			dataOne.put("bloodSugar", bloodSugar);
			dataOne.put("bsResult", bsResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 30血糖
	@RequestMapping(path = { "/healthpassport/bloodSugarRecordsthirty.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bsRecordsthirty(String memberid,String gender) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodSugarBean> result = BloodSugarService.selectMemberidthirty(memberid);
		DataAnalysisBean Bsdata = DataAnalysisService.selectdataBs(gender);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String bloodSugar = result.get(i).getBloodSugar().toString();
			String bsResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("bloodSugarmin", String.valueOf(Bsdata.getMinvalue()));
			dataOne.put("bloodSugarmax", String.valueOf(Bsdata.getMaxvalue()));
			dataOne.put("bloodSugar", bloodSugar);
			dataOne.put("bsResult", bsResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 180血糖
	@RequestMapping(path = { "/healthpassport/bloodSugarRecordsthreemon.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bsRecordsthreemon(String memberid,String gender) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodSugarBean> result = BloodSugarService.selectMemberidthreemon(memberid);
		DataAnalysisBean Bsdata = DataAnalysisService.selectdataBs(gender);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String bloodSugar = result.get(i).getBloodSugar().toString();
			String bsResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("bloodSugarmin", String.valueOf(Bsdata.getMinvalue()));
			dataOne.put("bloodSugarmax", String.valueOf(Bsdata.getMaxvalue()));
			dataOne.put("bloodSugar", bloodSugar);
			dataOne.put("bsResult", bsResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 7血壓
	@RequestMapping(path = { "/healthpassport/bloodPressureRecordsseven.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bpRecordsseven(String memberid,String gender,String age) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		List<BloodPressureBean> result = bloodPressureService.selectMemberidseven(memberid);
		int ageint = Integer.valueOf(age);	
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			DataAnalysisBean Diastole = DataAnalysisService.selectGroupId("BloodPressureDiastole", gender, ageint);
			DataAnalysisBean Systole = DataAnalysisService.selectGroupId("BloodPressureSystole", gender, ageint);
			String systole = result.get(i).getMaxBloodPressure().toString();
			String diastole = result.get(i).getMinBloodPressure().toString();
			String heartBeat = result.get(i).getHeartBeat().toString();
			String bpResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("diastolecheckmax", String.valueOf(Diastole.getMaxvalue()));
			dataOne.put("diastolecheckmin",String.valueOf(Diastole.getMinvalue()));
			dataOne.put("systolecheckmin",String.valueOf(Systole.getMinvalue()));
			dataOne.put("systolecheckmax",String.valueOf(Systole.getMaxvalue()));
			dataOne.put("systole", systole);
			dataOne.put("diastole", diastole);
			dataOne.put("heartBeat", heartBeat);
			dataOne.put("bpResult", bpResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 30血壓
	@RequestMapping(path = { "/healthpassport/bloodPressureRecordsthirty.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bpRecordsthirty(String memberid,String gender,String age) {

		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodPressureBean> result = bloodPressureService.selectMemberidthirty(memberid);
		int ageint = Integer.valueOf(age);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			DataAnalysisBean Diastole = DataAnalysisService.selectGroupId("BloodPressureDiastole", gender, ageint);
			DataAnalysisBean Systole = DataAnalysisService.selectGroupId("BloodPressureSystole", gender, ageint);
			String systole = result.get(i).getMaxBloodPressure().toString();
			String diastole = result.get(i).getMinBloodPressure().toString();
			String heartBeat = result.get(i).getHeartBeat().toString();
			String bpResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("diastolecheckmax", String.valueOf(Diastole.getMaxvalue()));
			dataOne.put("diastolecheckmin",String.valueOf(Diastole.getMinvalue()));
			dataOne.put("systolecheckmin",String.valueOf(Systole.getMinvalue()));
			dataOne.put("systolecheckmax",String.valueOf(Systole.getMaxvalue()));
			dataOne.put("systole", systole);
			dataOne.put("diastole", diastole);
			dataOne.put("heartBeat", heartBeat);
			dataOne.put("bpResult", bpResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}

	// 180血壓
	@RequestMapping(path = { "/healthpassport/bloodPressureRecordsthreemon.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bpRecordsthreemon(String memberid,String gender,String age) {

		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BloodPressureBean> result = bloodPressureService.selectMemberidthreemon(memberid);
		int ageint = Integer.valueOf(age);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			DataAnalysisBean Diastole = DataAnalysisService.selectGroupId("BloodPressureDiastole", gender, ageint);
			DataAnalysisBean Systole = DataAnalysisService.selectGroupId("BloodPressureSystole", gender, ageint);
			String systole = result.get(i).getMaxBloodPressure().toString();
			String diastole = result.get(i).getMinBloodPressure().toString();
			String heartBeat = result.get(i).getHeartBeat().toString();
			String bpResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("diastolecheckmax", String.valueOf(Diastole.getMaxvalue()));
			dataOne.put("diastolecheckmin",String.valueOf(Diastole.getMinvalue()));
			dataOne.put("systolecheckmin",String.valueOf(Systole.getMinvalue()));
			dataOne.put("systolecheckmax",String.valueOf(Systole.getMaxvalue()));
			dataOne.put("systole", systole);
			dataOne.put("diastole", diastole);
			dataOne.put("heartBeat", heartBeat);
			dataOne.put("bpResult", bpResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}
	//7bmi
	@RequestMapping(path = { "/healthpassport/bmirecordsseven.controller" }, method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public @ResponseBody String bmiRecordsseven(String memberid) {
		LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<BMIBean> result = bmiService.selectMemberidseven(memberid);
		for (int i = 0; i < result.size(); i++) {
			HashMap<String, String> dataOne = new HashMap<String, String>();
			String height = result.get(i).getHeight().toString();
			String weight = result.get(i).getWeight().toString();
			String bmi = result.get(i).getBmi().toString();
			String bmiResult = result.get(i).getResult();
			String createTime = sdf.format(result.get(i).getCreateTime());
			dataOne.put("height", height);
			dataOne.put("weight", weight);
			dataOne.put("bmi", bmi);
			dataOne.put("bmiResult", bmiResult);
			dataOne.put("createTime", createTime);
			datafinal.add(dataOne);
		}
		HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
		datas.put("data", datafinal);
		String data = new Gson().toJson(datas);
		return data;
	}
	//30bmi
		@RequestMapping(path = { "/healthpassport/bmirecordsthirty.controller" }, method = { RequestMethod.GET,
				RequestMethod.POST }, produces = "application/json;charset=UTF-8")
		public @ResponseBody String bmiRecordsthrity(String memberid) {
			LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<BMIBean> result = bmiService.selectMemberidthirty(memberid);
			for (int i = 0; i < result.size(); i++) {
				HashMap<String, String> dataOne = new HashMap<String, String>();
				String height = result.get(i).getHeight().toString();
				String weight = result.get(i).getWeight().toString();
				String bmi = result.get(i).getBmi().toString();
				String bmiResult = result.get(i).getResult();
				String createTime = sdf.format(result.get(i).getCreateTime());
				dataOne.put("height", height);
				dataOne.put("weight", weight);
				dataOne.put("bmi", bmi);
				dataOne.put("bmiResult", bmiResult);
				dataOne.put("createTime", createTime);
				datafinal.add(dataOne);
			}
			HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
			datas.put("data", datafinal);
			String data = new Gson().toJson(datas);
			return data;
		}//180bmi
		@RequestMapping(path = { "/healthpassport/bmirecordsthreemon.controller" }, method = { RequestMethod.GET,
				RequestMethod.POST }, produces = "application/json;charset=UTF-8")
		public @ResponseBody String bmiRecordsthreemon(String memberid) {
			LinkedList<HashMap<String, String>> datafinal = new LinkedList<HashMap<String, String>>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<BMIBean> result = bmiService.selectMemberidthreemon(memberid);
			for (int i = 0; i < result.size(); i++) {
				HashMap<String, String> dataOne = new HashMap<String, String>();
				String height = result.get(i).getHeight().toString();
				String weight = result.get(i).getWeight().toString();
				String bmi = result.get(i).getBmi().toString();
				String bmiResult = result.get(i).getResult();
				String createTime = sdf.format(result.get(i).getCreateTime());
				dataOne.put("height", height);
				dataOne.put("weight", weight);
				dataOne.put("bmi", bmi);
				dataOne.put("bmiResult", bmiResult);
				dataOne.put("createTime", createTime);
				datafinal.add(dataOne);
			}
			HashMap<String, LinkedList<HashMap<String, String>>> datas = new HashMap<String, LinkedList<HashMap<String, String>>>();
			datas.put("data", datafinal);
			String data = new Gson().toJson(datas);
			return data;
		}
}

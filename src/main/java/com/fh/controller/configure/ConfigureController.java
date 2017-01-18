package com.fh.controller.configure;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Role;
import com.fh.service.configure.ConfigureService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

import net.sf.ehcache.config.generator.ConfigurationUtil;

@Controller
@RequestMapping("/config")
public class ConfigureController extends BaseController{
	
	String menuUrl = "config/getNPowerList"; //菜单地址(权限用)
	
	private String nPowerJsp = "foundation/npower/npower_list"; //普通电源查询jsp
	private String nPowerEditJsp = "";  						//普通电源修改jsp
	private String nPowerCreateJsp = "";  						//普通电源新增jsp
	private String lampJsp = "foundation/light/light_list";  	//灯查询jsp
	private String lampEditJsp = "foundation/light/light_edit";  							//灯修改jsp
	private String lampCreateJsp = "foundation/light/light_edit";  						//灯新增jsp
	private String poleJsp = "foundation/pole/pole_list";       //灯杆杆查询jsp
	private String poleEditJsp = "foundation/pole/pole_edit";  							//灯杆修改jsp
	private String poleCreateJsp = "foundation/pole/pole_edit";  						//灯杆新增jsp
	private String sensorJsp = "foundation/sensor/sensor_list"; //传感器杆查询jsp
	private String sensorEditJsp = "foundation/sensor/sensor_edit";  						//传感器修改jsp
	private String sensorCreateJsp = "foundation/sensor/sensor_edit";  						//传感器新增jsp
	private String simJsp = "foundation/simcard/simcard_list";    //Sim卡杆查询jsp
	private String simEditJsp = "foundation/simcard/simcard_edit";  							//Sim卡修改jsp
	private String simCreateJsp = "foundation/simcard/simcard_edit";  							//Sim卡新增jsp
	
	private String deviceJsp = "foundation/combination/combination_list";
	private String deviceEditJsp = "foundation/combination/combination_edit";
	private String deviceCreateJsp="foundation/combination/combination_edit";
	
	private String saveRsultJsp = "save_result";  				//保存修改jsp
	
	
	@Resource(name="configureService")
	private ConfigureService configureService;
	
	
	/**
	 * 获取普通电源列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getNPowerList")
	public ModelAndView getNPowerList(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = configureService.getNPowerList(page);
		mv.addObject("pd", pd);
		mv.addObject("nPowerList", nPList);
		mv.setViewName(nPowerJsp);
		return mv;
	}
	
	/**
	 * 跳转普通电源修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goNPowerEdit")
	public ModelAndView goNPowerEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = configureService.getNPowerById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editNPower");
		mv.setViewName(nPowerEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转普通电源新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goNPowerCreate")
	public ModelAndView goNPowerCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "createNPower");
		mv.setViewName(nPowerCreateJsp);
		return mv;
	}
	
	/**
	 * 修改普通电源
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editNPower")
	public ModelAndView editNPower() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.editNPower(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 新增普通电源
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createNPower")
	public ModelAndView createNPower() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.createNPower(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 获取灯信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getLampList")
	public ModelAndView getLampList(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = configureService.getLampList(page);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("lampList", nPList);
		mv.setViewName(lampJsp);
		return mv;
	}
	
	/**
	 * 跳转灯修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goLampEdit")
	public ModelAndView goLampEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = configureService.getLampById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editLamp");
		mv.setViewName(lampEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转灯新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goLampCreate")
	public ModelAndView goLampCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "createLamp");
		mv.setViewName(lampCreateJsp);
		return mv;
	}
	
	/**
	 * 修改灯信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editLamp")
	public ModelAndView editLamp() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.editLamp(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	
	/**
	 * 新增灯信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createLamp")
	public ModelAndView createLamp() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.createLamp(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	
	
	/**
	 * 获取传感器列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getSensorList")
	public ModelAndView getSensorList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = configureService.getSensorList(page);
		mv.addObject("pd", pd);
		mv.addObject("sensorList", nPList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.setViewName(sensorJsp);
		return mv;
	}
	
	/**
	 * 跳转传感器修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSensorEdit")
	public ModelAndView goSensorEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = configureService.getSensorById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editSensor");
		mv.setViewName(sensorEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转传感器新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSensorCreate")
	public ModelAndView goSensorCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "createSensor");
		mv.setViewName(sensorCreateJsp);
		return mv;
	}
	
	/**
	 * 修改传感器
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editSensor")
	public ModelAndView editSensor() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.editSensor(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	/**
	 * 新增传感器
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createSensor")
	public ModelAndView createSensor() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.createSensor(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	
	
	/**
	 * 获取电线杆
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getPoleList")
	public ModelAndView getPoleList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = configureService.getPoleList(page);
		mv.addObject("pd", pd);
		mv.addObject("poleList", nPList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.setViewName(poleJsp);
		return mv;
	}
	
	/**
	 * 跳转灯杆修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goPoleEdit")
	public ModelAndView goPoleEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = configureService.getPoleById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editPole");
		mv.setViewName(poleEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转灯杆新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goPoleCreate")
	public ModelAndView goPoleCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "createPole");
		mv.setViewName(poleCreateJsp);
		return mv;
	}
	
	
	/**
	 * 修改电线杆
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editPole")
	public ModelAndView editPole() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.editPole(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 新增电线杆
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createPole")
	public ModelAndView createPole() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.createPole(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 获取Sim卡列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getSimList")
	public ModelAndView getSimList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = configureService.getSimList(page);
		mv.addObject("pd", pd);
		mv.addObject("simList", nPList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.setViewName(simJsp);
		return mv;
	}
	
	/**get
	 * 跳转Sim卡修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSimEdit")
	public ModelAndView goSimEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = configureService.getSimById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editSim");
		mv.setViewName(simEditJsp);
		return mv;
	}
	
	/**
	 * 跳转Sim卡新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSimCreate")
	public ModelAndView goSimCreate(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "createSim");
		mv.setViewName(simCreateJsp);
		return mv;
	}
	
	/**
	 * 修改Sim卡
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editSim")
	public ModelAndView editSim() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.editSim(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 新增Sim卡
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createSim")
	public ModelAndView createSim() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		configureService.createSim(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;
		
	}
	
	/**
	 * 跳转一体化电源页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goYTHPower")
	public ModelAndView goYTHPower(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		pd.put("itype", 1);
		List<PageData> list = configureService.getDeviceList(page);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", list);
		mv.setViewName(deviceJsp);
		return mv;
	}
	
	
	/**
	 * 跳转单灯控制器
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goDDController")
	public ModelAndView goDDController(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("itype", 2);
		page.setPd(pd);
		List<PageData> list = configureService.getDeviceList(page);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", list);
		mv.setViewName(deviceJsp);
		return mv;
		
	}
	
	/**
	 * 跳转网关断路器页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goGatewayAndBreak")
	public ModelAndView goGatewayAndBreak(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("itype", 3);
		page.setPd(pd);
		List<PageData> list = configureService.getGatewayList(page);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", list);
		mv.setViewName(deviceJsp);
		return mv;
		
	}
	
	/**
	 * 跳转组合终端
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goCombination")
	public ModelAndView goCombination(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("itype", 4);
		page.setPd(pd);
		List<PageData> deviceList = configureService.getDeviceList(page);
		deviceList.addAll(configureService.getGatewayList(page));
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", deviceList);
		mv.setViewName(deviceJsp);
		return mv;
		
	}
	
	/**
	 * 终端查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getDeviceList")
	public ModelAndView getDeviceList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> deviceList = null;
		String typeString = (String)pd.get("type");
		if(typeString.equals("")){
			deviceList = configureService.getDeviceList(page);
			deviceList.addAll(configureService.getGatewayList(page));
			pd.put("itype", 4);
			
		}else{
			int type = Integer.valueOf(typeString);
			if(type==1||type==2){
				deviceList = configureService.getDeviceList(page);
				pd.put("itype", type);
			}else if(type==3||type==4||type==5){
				deviceList = configureService.getGatewayList(page);
				pd.put("itype", 3);
			}
		}
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", deviceList);
		mv.setViewName(deviceJsp);
		return mv;
		
	}
	
	
	/**
	 * 跳转终端修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goDeviceEdit")
	public ModelAndView goDeviceEdit(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> nPList = configureService.getAllNPower(pd);
		List<PageData> lampList = configureService.getAllLamp(pd);
		List<PageData> poleList = configureService.getAllPole(pd);
		List<PageData> simList = configureService.getAllSim(pd);
		List<PageData> sensorList = configureService.getAllSensor(pd);
		
		int typeid = Integer.valueOf((String)pd.get("typeid"));
		if(typeid==1||typeid==2){
			pd = configureService.getDeviceById(pd);
			System.out.println("getDeviceById :name"+pd.get("name"));
			
		}else if(typeid==3||typeid==4||typeid==5){
			pd = configureService.getGatewayAndBreakById(pd);
			System.out.println("getGatewayById :name"+pd.get("name"));
		}
		mv.addObject("pd", pd);
		mv.addObject("powerList",nPList);
		mv.addObject("lampList", lampList);
		mv.addObject("poleList", poleList);
		mv.addObject("simList", simList);
		mv.addObject("sensorList", sensorList);
		
		mv.addObject("msg", "editDevice");
		mv.setViewName(deviceEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转终端新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goDeviceCreate")
	public ModelAndView goDeviceCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> powerList = configureService.getAllNPower(pd);
		List<PageData> lampList = configureService.getAllLamp(pd);
		List<PageData> poleList = configureService.getAllPole(pd);
		List<PageData> simList = configureService.getAllSim(pd);
		List<PageData> sensorList = configureService.getAllSensor(pd);
		
		mv.addObject("powerList",powerList);
		mv.addObject("lampList", lampList);
		mv.addObject("poleList", poleList);
		mv.addObject("simList", simList);
		mv.addObject("sensorList", sensorList);
		
		mv.addObject("msg", "createDevice");
		mv.setViewName(deviceCreateJsp);
		return mv;
	}

	@RequestMapping("/editDevice")
	public ModelAndView editDevice() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int typeid = Integer.valueOf((String)pd.get("typeid"));
		if(typeid==1||typeid==2){
			configureService.editDevice(pd);
		}else if(typeid==3||typeid==4||typeid==5){
			configureService.editGateway(pd);
			
		}
		mv.setViewName(saveRsultJsp);
		return mv;
		
		
	}
	
	@RequestMapping("/createDevice")
	public ModelAndView createDevice() throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int typeid = Integer.valueOf((String)pd.get("typeid"));
		
		System.out.println("typeid="+typeid);
		if(typeid==1||typeid==2){
			configureService.createDevice(pd);
		}else if(typeid==3||typeid==4||typeid==5){
			configureService.createGateway(pd);
			
		}
		mv.setViewName(saveRsultJsp);
		return mv;
	}
	
}

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

@Controller
@RequestMapping("/config")
public class ConfigureController extends BaseController{
	
	String menuUrl = "config/getNPowerList"; //菜单地址(权限用)
	
	private String nPowerJsp = "foundation/npower/npower_list"; //普通电源查询jsp
	private String nPowerEditJsp = "";  						//普通电源修改jsp
	private String nPowerCreateJsp = "";  						//普通电源新增jsp
	private String lampJsp = "foundation/npower/npower_list";  	//灯查询jsp
	private String lampEditJsp = "";  							//灯修改jsp
	private String lampCreateJsp = "";  						//灯新增jsp
	private String poleJsp = "foundation/npower/npower_list";   //灯杆杆查询jsp
	private String poleEditJsp = "";  							//灯杆修改jsp
	private String poleCreateJsp = "";  						//灯杆新增jsp
	private String sensorJsp = "foundation/npower/npower_list"; //传感器杆查询jsp
	private String sensorEditJsp = "";  						//传感器修改jsp
	private String sensorCreateJsp = "";  						//传感器新增jsp
	private String simJsp = "foundation/npower/npower_list";    //Sim卡杆查询jsp
	private String simEditJsp = "";  							//Sim卡修改jsp
	private String simCreateJsp = "";  							//Sim卡新增jsp
	
	private String deviceJsp = "";
	private String deviceEditJsp = "";
	private String deviceCreateJsp="";
	
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
		List<PageData> nPList = configureService.getNPowerList(page);
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
		mv.setViewName(nPowerJsp);
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
		mv.addObject("sensorList", nPList);
		mv.setViewName(nPowerJsp);
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
		mv.addObject("poleList", nPList);
		mv.setViewName(nPowerJsp);
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
		mv.addObject("simList", nPList);
		mv.setViewName(nPowerJsp);
		return mv;
	}
	
	/**
	 * 跳转Sim卡修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSimEdit")
	public ModelAndView goSimEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
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
	 * 获取终端列表
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
		int type = (Integer)pd.get("itype");
		if(type==1){
			//终端
			deviceList = configureService.getDeviceList(page);
			
		}else if(type==2){
			//网关、断路器
			deviceList = configureService.getDeviceList(page);
		}else if(type==3){
			//组合
			deviceList = configureService.getDeviceList(page);
			deviceList.addAll(configureService.getGatewayList(page));
		}
		
		mv.addObject("deviceList", deviceList);
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
		List<PageData> nPList = configureService.getNPowerList(page);
		List<PageData> lampList = configureService.getLampList(page);
		List<PageData> poleList = configureService.getPoleList(page);
		List<PageData> simList = configureService.getSimList(page);
		List<PageData> sensorList = configureService.getSensorList(page);
		mv.addObject("nPList",nPList);
		mv.addObject("lampList", lampList);
		mv.addObject("poleList", poleList);
		mv.addObject("simList", simList);
		mv.addObject("sensorList", sensorList);
		
		mv.addObject("msg", "editDevice");
		mv.setViewName(deviceEditJsp);
		return mv;
	
	}
	
	/**
	 * 跳转Sim卡新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSimCreate")
	public ModelAndView goDeviceCreate(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> nPList = configureService.getNPowerList(page);
		List<PageData> lampList = configureService.getLampList(page);
		List<PageData> poleList = configureService.getPoleList(page);
		List<PageData> simList = configureService.getSimList(page);
		List<PageData> sensorList = configureService.getSensorList(page);
		mv.addObject("nList",nPList);
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
		if((Integer)pd.get("itype")==1){
			configureService.editDevice(pd);
		}else if((Integer)pd.get("itype")==2){
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
		if((Integer)pd.get("itype")==1){
			configureService.createDevice(pd);
		}else if((Integer)pd.get("itype")==2){
			configureService.createGateway(pd);
		}
		mv.setViewName(saveRsultJsp);
		return mv;
	}
	
}

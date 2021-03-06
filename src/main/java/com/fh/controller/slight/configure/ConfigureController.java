package com.fh.controller.slight.configure;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.hzy.util.UserUtils;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.slight.configure.ConfigureService;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.Const;
import com.fh.util.FileDownload;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

@Controller
@RequestMapping("/config")
public class ConfigureController extends BaseController{
	
	
	private String deviceJsp = "foundation/combination/combination_list";
	private String deviceEditJsp = "foundation/combination/combination_edit";
	private String deviceCreateJsp="foundation/combination/combination_edit";
	
	private String uploadJsp="foundation/combination/uploadexcel";
	private String saveRsultJsp = "save_result";  				//保存修改jsp
	
	
	@Resource(name="configureService")
	private ConfigureService configureService;
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	

	/**下载普通电源模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		String xlsname = "device.xls";
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + xlsname, xlsname);
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName(uploadJsp);
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
		pd.put("userids", departmentService.getUseridsInDepartment(pd));
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
		pd.put("userids", departmentService.getUseridsInDepartment(pd));
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
		pd.put("userids", departmentService.getUseridsInDepartment(pd));
		page.setPd(pd);
		List<PageData> list = configureService.getGatewayList(page);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("deviceList", list);
		mv.setViewName(deviceJsp);
		return mv;
		
	}
	
	/**
	 * 跳转终端组合
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
		pd.put("userids", departmentService.getUseridsInDepartment(pd));
		page.setPd(pd);
		List<PageData> deviceList = configureService.getDeviceList(page);
		mv.addObject("pd", pd);
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
		pd.put("userids", departmentService.getUseridsInDepartment(pd));
		page.setPd(pd);
		List<PageData> deviceList = null;
		int type = Integer.valueOf((String)pd.get("type"));
		if(type==1||type==2||type==6){
			deviceList = configureService.getDeviceList(page);
			pd.put("itype", type==6?4:type);
		}else if(type==3||type==4||type==5){
			deviceList = configureService.getGatewayList(page);
			pd.put("itype", 3);
		}
		if(pd.get("excel")!=null&&pd.getString("excel").equals("1")){
			ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
			mv = new ModelAndView(erv,ConfigureUtils.exportDevice(deviceList));
			return mv;
			
		}else{
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			mv.addObject("deviceList", deviceList);
			mv.setViewName(deviceJsp);
			return mv;
		}
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
		if(typeid==1||typeid==2||typeid==6){
			pd = configureService.getDeviceById(pd);
			
		}else if(typeid==3||typeid==4||typeid==5){
			pd = configureService.getGatewayAndBreakById(pd);
		}
		String coordinate = pd.getString("coordinate");
		if(coordinate.equals(",")){
			pd.put("longitude", "");
			pd.put("latitude", "");
		}else if(coordinate.substring(0, 1).equals(",")){
			pd.put("longitude", "");
			pd.put("latitude", coordinate.substring(1));
		}else if(coordinate.substring(coordinate.length()-1).equals(",")){
			pd.put("longitude", coordinate.substring(0, coordinate.length()-1));
			pd.put("latitude", "");
		}else{
			String[] zuobiao = coordinate.split(",");
			pd.put("longitude", zuobiao[0]);
			pd.put("latitude", zuobiao[1]);
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

	/**
	 * 修改终端
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editDevice")
	public ModelAndView editDevice() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int typeid = Integer.valueOf((String)pd.get("typeid"));
		pd.put("coordinate", pd.getString("longitude")+","+pd.getString("latitude"));
		pd.put("status", 1);
		
		if(pd.getString("power").equals("")){
			pd.put("power", null);
		}
		if(pd.getString("pole").equals("")){
			pd.put("pole", null);
		}
		if(pd.getString("lamp").equals("")){
			pd.put("lamp", null);
		}
		if(pd.getString("sim").equals("")){
			pd.put("sim", null);
		}
		if(pd.getString("sensor").equals("")){
			pd.put("sensor", null);
		}
		if(typeid==1||typeid==2||typeid==6){
			configureService.editDevice(pd);
		}else if(typeid==3||typeid==4||typeid==5){
			configureService.editGateway(pd);
			
		}
		mv.setViewName(saveRsultJsp);
		return mv;
		
		
	}
	
	/**
	 * 新增终端
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/createDevice")
	public ModelAndView createDevice() throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int typeid = Integer.valueOf((String)pd.get("typeid"));
		pd.put("userid", UserUtils.getUserid());
		pd.put("coordinate", pd.getString("longitude")+","+pd.getString("latitude"));
		pd.put("status", 1);
		System.out.println("power="+pd.getString("power"));
		System.out.println("pole="+pd.getString("pole"));
		System.out.println("lamp="+pd.getString("lamp"));
		if(typeid==1||typeid==2||typeid==6){
			configureService.createDevice(pd);
		}else if(typeid==3||typeid==4||typeid==5){
			configureService.createGateway(pd);
			
		}
		mv.setViewName(saveRsultJsp);
		return mv;
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet

			for(int i=0;i<listPd.size();i++){		
				
				int type = ConfigureUtils.getDeviceType(listPd.get(i).getString("var2"));
				pd.put("number", listPd.get(i).getString("var0"));										//ID
				pd.put("name", listPd.get(i).getString("var1"));							//姓名
				pd.put("location", listPd.get(i).getString("var3"));
				pd.put("coordinate", listPd.get(i).getString("var4"));
				pd.put("polenumber", listPd.get(i).getString("var5"));
				pd.put("password", listPd.get(i).getString("var6"));
				pd.put("comment", listPd.get(i).getString("var7"));
				pd.put("status", 1);
				pd.put("typeid", type);
				pd.put("userid", UserUtils.getUserid());
				if(type==1||type==2||type==6){
//					pd.put("mobile", listPd.get(i).getString("var5"));
//					pd.put("sensor", listPd.get(i).getString("var8"));
//					pd.put("pole", listPd.get(i).getString("var9"));
					configureService.createDevice(pd);
				}
				if(type==3||type==4||type==5){
//					pd.put("power", listPd.get(i).getString("var6"));
//					pd.put("lamp", listPd.get(i).getString("var7"));
//					pd.put("pole", listPd.get(i).getString("var9"));
					configureService.createGateway(pd);
				}
				
			}
			mv.addObject("msg","success");
		}
		mv.setViewName(saveRsultJsp);
		return mv;
	}
	
	
	@RequestMapping("/testNumber")
	@ResponseBody
	public PageData testNumber() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String number = pd.getString("number");
		pd = configureService.getDeviceByNumber(pd);
		long d = (long)pd.get("count");
		pd.put("number", number);
		pd = configureService.getGatewayByNumber(pd);
		long g = (long)pd.get("count");
		pd.put("count", d+g);
		return pd;
		
	}
}

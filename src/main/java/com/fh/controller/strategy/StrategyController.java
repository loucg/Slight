package com.fh.controller.strategy;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.role.RoleManager;
import com.fh.service.strategy.StrategyManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileDownload;
import com.fh.util.FileUpload;
import com.fh.util.GetPinyin;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.PageData;
import com.fh.util.ObjectExcelView;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/** 
 * 类名称：StrategyController
 * 创建人：zjc
 * 更新时间：2017年2月7日
 * @version
 */
@Controller
@RequestMapping(value="/strategy")
public class StrategyController extends BaseController {
	
	String menuUrl = "strategy/listStrategys.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	@Resource(name="strategyService")
	private StrategyManager strategyService;

	/**显示策略列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listStrategys")
	public ModelAndView listStrategys(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String name = pd.getString("name");			//检索条件：策略名称
		if(null !=name && !"".equals(name)){
			pd.put("name", name.trim());
		}
		String explain = pd.getString("explain");		//检索条件：应用说明
		if(null !=explain && !"".equals(explain)){
			pd.put("explain", explain.trim());
		}
		page.setPd(pd);
		List<PageData>	strategyList = strategyService.listStrategys(page);	//列出策略列表
		JsonParser parse =new JsonParser();                                 //创建json解析器
		for(int i = 0 ; i < strategyList.size(); i++){
			List<Object> t_i = new ArrayList<Object>();
			List<String> timestamp = new ArrayList<String>();
			List<String> intensity = new ArrayList<String>();
			if(strategyList.get(i).getString("json") != null && !strategyList.get(i).getString("json").equals("")){
				JsonObject json=(JsonObject) parse.parse(strategyList.get(i).getString("json"));
				strategyList.get(i).put("odd_even", json.get("odd_even").getAsString());
				JsonArray temp = json.get("t_i").getAsJsonArray();
				for(int j = 0; j < temp.size(); j++){
					t_i.add(temp.get(j).getAsJsonObject());
					timestamp.add(temp.get(j).getAsJsonObject().get("timestamp").getAsString());
					intensity.add(temp.get(j).getAsJsonObject().get("intensity").getAsString());
				}	
			}
			strategyList.get(i).put("t_i", t_i);
			strategyList.get(i).put("timestamp", timestamp);
			strategyList.get(i).put("intensity", intensity);
		}
		System.out.println(strategyList);
		mv.setViewName("strategy/strategy_list");
		mv.addObject("strategyList", strategyList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增策略页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddS")
	public ModelAndView goAddS()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("strategy/strategy_edit");
		mv.addObject("msg", "saveS");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存策略
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveS")
	public ModelAndView saveS() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增策略");
		
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得登录的用户id
		//User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		//String sys_user_id = user.getUSER_ID();
		//pd.put("sys_user_id", sys_user_id);
		//logBefore(logger, pd.getString("name")+pd.getString("explain")+pd.getString("type"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String TDATE = df.format(new Date());
		pd.put("TDATE", TDATE);				//创建时间
		strategyService.addStrategy(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改策略页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditS")
	public ModelAndView goEditS() throws Exception{
		logBefore(logger, "准备修改策略");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = strategyService.findById(pd);								//根据ID读取
		List<Object> t_i = new ArrayList<Object>();
		if(pd.getString("json") != null && !pd.getString("json").equals("")){
			JsonParser parse =new JsonParser();                             //创建json解析器
			JsonObject json=(JsonObject) parse.parse(pd.getString("json"));
			pd.put("odd_even", json.get("odd_even").getAsString());
			JsonArray temp = json.get("t_i").getAsJsonArray();
			for(int i = 0; i < temp.size(); i++){
				t_i.add(temp.get(i).getAsJsonObject());
			}	
		}
		pd.put("t_i", t_i);
		mv.setViewName("strategy/strategy_edit");
		mv.addObject("msg", "editS");
		mv.addObject("pd", pd);
		return mv;
	}
			
	/**
	 * 修改策略
	 */
	@RequestMapping(value="/editS")
	public ModelAndView editS() throws Exception{
		logBefore(logger,"正在修改策略");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		strategyService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
			
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}

package com.fh.controller.system.userInfo;

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
import com.fh.entity.system.Language;
import com.fh.entity.system.Role;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.language.LanguageManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.role.RoleManager;
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

/** 
 * 类名称：UserInfoController
 * 创建人：zjc
 * 更新时间：2017年1月21日
 * @version
 */
@Controller
@RequestMapping(value="/userInfo")
public class UserInfoController extends BaseController {
	
	String menuUrl = "userInfo/userInfo.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	@Resource(name="languageService")
	private LanguageManager languageService;
	
	/**显示用户信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userInfo")
	public ModelAndView userInfo(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/userInfo/userInfo_view");	
		PageData userInfo = new PageData();
		userInfo.put("USERNAME", Jurisdiction.getUsername());
		userInfo = userService.findUserInfoByUsername(userInfo);//根据username读取用户信息
		mv.addObject("userInfo", userInfo);
		return mv;
	}
	
	/**去修改用户信息页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditUserInfo")
	public ModelAndView goEditUserInfo() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/userInfo/userInfo_edit");
		PageData pd = new PageData();
		pd.put("USERNAME", Jurisdiction.getUsername());
		pd = userService.findUserInfoByUsername(pd);//根据username读取用户信息
		List<Language> languageList = languageService.listAllLanguagesByPId(pd);
		mv.addObject("msg", "editUserInfo");//修改用户函数
		mv.addObject("pd", pd);	
		mv.addObject("languageList", languageList);
		return mv;
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping(value="/editUserInfo")
	public ModelAndView editUserInfo() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(!Jurisdiction.getUsername().equals(pd.getString("USERNAME"))){		//如果当前登录用户修改用户资料提交的用户名非本人
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}  //校验权限 判断当前操作者有无用户管理查看权限
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限判断当前操作者有无用户管理修改权限
			if("admin".equals(pd.getString("USERNAME")) && !"admin".equals(Jurisdiction.getUsername())){return null;}	//非admin用户不能修改admin
		}else{	//如果当前登录用户修改用户资料提交的用户名是本人，则不能修改本人的角色ID
			pd.put("ROLE_ID", userService.findByUsername(pd).getString("ROLE_ID")); //对角色ID还原本人角色ID
		}
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());
		}
		userService.editUserInfo(pd);	//执行修改
		FHLOG.save(Jurisdiction.getUsername(), "修改用户信息："+pd.getString("USERNAME"));
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU")
	public ModelAndView saveU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", this.get32UUID());	//ID 主键
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("STATUS", "0");					//状态
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");		
		pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());	//密码加密
		if(null == userService.findByUsername(pd)){	//判断用户名是否存在
			userService.saveU(pd); 					//执行保存
			FHLOG.save(Jurisdiction.getUsername(), "新增系统用户："+pd.getString("USERNAME"));
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

}
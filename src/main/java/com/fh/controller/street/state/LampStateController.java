package com.fh.controller.street.state;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.street.state.LampStateService;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 路灯状态-路灯状态列表
 * @author xiaozhou
 * 创建时间：2017年2月17日
 */
@Controller
@RequestMapping(value="/state/lamp")
public class LampStateController extends BaseController{

	String menuUrl = "state/lamp/listLamps.do";		//页面配置的菜单地址
    @Resource(name="lampStateService")
    private LampStateService lampStateService;
	
	/**
	 * 显示路灯状态列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/listLamps")
	public ModelAndView listLamps(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData lampstatus = new PageData();
		pd = this.getPageData();
		String tname = pd.getString("tname");			//检索条件：组名
		if(null !=tname && !"".equals(tname)){
			pd.put("tname", tname.trim());
		}
		String cname = pd.getString("cname");		//检索条件：名称
		if(null !=cname && !"".equals(cname)){
			pd.put("cname", cname.trim());
		}
		String ccode = pd.getString("ccode");		//检索条件：编号
		if(null !=ccode && !"".equals(ccode)){
			pd.put("ccode", ccode.trim());
		}
		String location = pd.getString("location");		//检索条件：位置
		if(null !=location && !"".equals(location)){
			pd.put("location", location.trim());
		}
		String lstatus = pd.getString("lstatus");		//检索条件：状态
		if(null !=lstatus && !"".equals(lstatus)){
			lampstatus = lampStateService.getStatus(pd);
			lstatus = lampstatus.getString("name");
			pd.put("lstatus", lstatus.trim());
		}
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		page.setPd(pd);
		List<PageData> lampStateList = lampStateService.listLampState(page);	//获取列表
		mv.setViewName("street/state/lampstate_list");
		mv.addObject("lampStateList", lampStateList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC());
		
		return mv;
	}
	
	/**
	 * 去灯的详细信息界面
	 */
	
	@RequestMapping("/goViewDetail")
	public ModelAndView goViewDetail() throws Exception {
		logBefore(logger, "goViewDetail");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		pd = lampStateService.viewLampDetail(pd);
		mv.setViewName("street/state/lampstate_view");
		//mv.addObject("msg", "update");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 去新增分组页面
	 */
/*	@RequestMapping("/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("groupmanage/groupmanage_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}*/
	
	/**新增分组页面的保存
	 * @param
	 * @throws Exception
	 */
/*	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增group");
		
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		//logBefore(logger, pd.getString("name")+pd.getString("explain")+pd.getString("type"));
		groupService.addGroup(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}*/
	
	/**去编辑分组页面
	 * @return
	 */
/*	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate() throws Exception {
		logBefore(logger, "goUpdate group page");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = groupService.findById(pd);
		mv.setViewName("groupmanage/groupmanage_edit");
		mv.addObject("msg", "update");
		mv.addObject("pd", pd);
		
		return mv;
	}*/
	
	/**编辑分组页面的保存
	 * @return
	 * @throws Exception
	 */
/*	@RequestMapping("/update")
	public ModelAndView update() throws Exception{
		logBefore(logger, "be sure edit group");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		logBefore(logger, pd.getString("name")+pd.getString("explain")+pd.getString("status"));
		groupService.updateGroup(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}*/
	
}

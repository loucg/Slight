package com.fh.controller.group;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.group.GroupService;
import com.fh.service.group.mem.GroupMemService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 分组设置
 * @author xiaozhou
 * 创建时间：2017年2月5日groupmem/listMems.do?id=1
 */
@Controller
@RequestMapping(value="/groupmem")
public class GroupMemController extends BaseController{

	String menuUrl = "groupmem/listMems.do";		//页面配置的菜单地址
    @Resource(name="groupMemService")
    private GroupMemService groupMemService;
    @Resource(name="groupService")
    private GroupService groupService;
	
	/**
	 * 显示已分组列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/listMems")
	public ModelAndView listMems(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData termforpage = new PageData();
		pd = this.getPageData();
		//System.out.println(pd.getString("id")+pd.getString("name")+"-------------------------------------");
		String location = pd.getString("location");			//检索条件：位置
		if(null !=location && !"".equals(location)){
			pd.put("location", location.trim());
		}
		String clientname = pd.getString("clientname");		//检索条件：终端名称
		if(null !=clientname && !"".equals(clientname)){
			pd.put("clientname", clientname.trim());
		}
		String lamp_pole_num = pd.getString("lamp_pole_num");		//检索条件：灯杆号
		if(null !=lamp_pole_num && !"".equals(lamp_pole_num)){
			pd.put("lamp_pole_num", lamp_pole_num.trim());
		}
		String client_code = pd.getString("client_code");		//检索条件：终端号
		if(null !=client_code && !"".equals(client_code)){
			pd.put("client_code", client_code.trim());
		}
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		//String title = pd.getString("title");
		
		page.setPd(pd);
		termforpage = groupService.findById(pd);
		List<PageData> groupMem = groupMemService.listMem(page);	//获取列表
		mv.setViewName("groupmanage/groupmember_list");
		
		/*if("chakan".equals(title)){
			mv.setViewName("groupmanage/groupmember_view");
		}else if("tishan".equals(title)){
			mv.setViewName("groupmanage/groupmember_list");
		}*/
		mv.addObject("groupMem", groupMem);
		mv.addObject("pd", pd);
		mv.addObject("termforpage", termforpage);
		mv.addObject("QX", Jurisdiction.getHC());
		
		return mv;
	}
	
	/**
	 * 显示未分组列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/listOthers")
	public ModelAndView listOthers(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData termforpage = new PageData();
		pd = this.getPageData();
		//System.out.println(pd.getString("id")+pd.getString("name")+"-------------------------------------");
		String location = pd.getString("location");			//检索条件：位置
		if(null !=location && !"".equals(location)){
			pd.put("location", location.trim());
		}
		String clientname = pd.getString("clientname");		//检索条件：终端名称
		if(null !=clientname && !"".equals(clientname)){
			pd.put("clientname", clientname.trim());
		}
		String lamp_pole_num = pd.getString("lamp_pole_num");		//检索条件：灯杆号
		if(null !=lamp_pole_num && !"".equals(lamp_pole_num)){
			pd.put("lamp_pole_num", lamp_pole_num.trim());
		}
		String client_code = pd.getString("client_code");		//检索条件：终端号
		if(null !=client_code && !"".equals(client_code)){
			pd.put("client_code", client_code.trim());
		}
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		page.setPd(pd);
		termforpage = groupService.findById(pd);
		List<PageData> groupOther = groupMemService.listOthers(page);	//获取列表
		mv.setViewName("groupmanage/groupother_list");
		mv.addObject("groupOther", groupOther);
		mv.addObject("pd", pd);
		mv.addObject("termforpage", termforpage);
		mv.addObject("QX", Jurisdiction.getHC());
		
		return mv;
	}
	
	/**
	 * 批量添加成员
	 */
	@RequestMapping("/addMems")
	@ResponseBody
	public Object addMems() throws Exception{
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		String c_term_id = pd.getString("id");
		pd.put("c_term_id", c_term_id);
		if(null !=DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd.put("c_client_id", ArrayDATA_IDS[i]);
				groupMemService.addMember(pd);
				pd.put("msg", "ok");
			}
		}else{
			pd.put("msg", "no");
			System.out.println("mei you shu ju ");
		}
		
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 批量踢删成员
	 */
	@RequestMapping("/removeMems")
	@ResponseBody
	public Object removeMems() throws Exception{
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		String c_term_id = pd.getString("id");
		pd.put("c_term_id", c_term_id);
		if(null !=DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd.put("c_client_id", ArrayDATA_IDS[i]);
				groupMemService.removeMember(pd);
				pd.put("msg", "ok");
			}
		}else{
			pd.put("msg", "no");
			System.out.println("mei you shu ju ");
		}
		
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
}

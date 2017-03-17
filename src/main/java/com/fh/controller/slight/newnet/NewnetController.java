package com.fh.controller.slight.newnet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.slight.newnet.NewnetService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 类名称：NewnetController
 * 创建人：mxc
 * 创建时间：2017-03-01
 */
@Controller
@RequestMapping(value="/newnet")
public class NewnetController extends BaseController {
	
	String menuUrl = "repair/newnet"; //菜单地址(权限用)
	@Resource(name="newnetService")
	private NewnetService newnetService;
	
	private String newnetJsp = "repair/newnet/newnet_list";                 //网关列表jsp
	private String newnetEditJsp = "repair/newnet/newnet_list_edit";  					//网关重组jsp
	private String newnetCreateJsp = "repair/newnet/newnet_edit";  					//网关编辑jsp
	private String saveRsultJsp = "save_result";  				//保存修改jsp
	
	/**
	 * 获取网关列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getNewnetList")
	public ModelAndView getNewnetList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> nPList = newnetService.getNewnetList(page);
		mv.addObject("pd", pd);
		
		mv.addObject("newnetList", nPList);
		mv.setViewName(newnetJsp);
		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	
	
	
	/**
	 * 跳转网关修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goNewnetEdit")
	public ModelAndView goNewnetEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = newnetService.getNewnetById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editNewnet");
		mv.setViewName(newnetEditJsp);
		return mv;
	}
	
	/**
	 * 跳转终端页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goClientList")
	public ModelAndView goClientList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list  = newnetService.getClientList(page);
		mv.addObject("gateway", pd.getString("id"));
		mv.addObject("clientList", list);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@RequestMapping("/addClient")
	public Object addClient() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		pd.put("gateway", pd.getString("id"));
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null !=DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd.put("c_client_id", ArrayDATA_IDS[i]);
				newnetService.addClients(pd);
				pd.put("msg", "ok");
			}
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
		
}

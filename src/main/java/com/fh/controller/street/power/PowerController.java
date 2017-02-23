package com.fh.controller.street.power;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.street.fault.FaultService;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 路灯状态-能耗状态
 * @author xiaozhou
 * 创建时间：2017年2月21日
 */
@Controller
@RequestMapping(value="/power/street")
public class PowerController extends BaseController{

	String menuUrl = "power/street/graphPowers.do";		//页面配置的菜单地址
    
	@Resource(name="faultService")
    private FaultService faultService;
	
	/**
	 * 显示图
	 * @param page
	 * @return
	 */
	@RequestMapping("/graphPowers")
	public ModelAndView graphPowers(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*String name = pd.getString("name");			//检索条件：名称
		if(null !=name && !"".equals(name)){
			pd.put("name", name.trim());
		}
		String gateway_code = pd.getString("gateway_code");		//检索条件：编号
		if(null !=gateway_code && !"".equals(gateway_code)){
			pd.put("gateway_code", gateway_code.trim());
		}
		String location = pd.getString("location");		//检索条件：位置
		if(null !=location && !"".equals(location)){
			pd.put("location", location.trim());
		}
		String fcomment = pd.getString("fcomment");		//检索条件：异常简述
		if(null !=fcomment && !"".equals(fcomment)){
			pd.put("fcomment", fcomment.trim());
		}*/
		//获得登录的用户id
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		String sys_user_id = user.getUSER_ID();
		pd.put("sys_user_id", sys_user_id);
		page.setPd(pd);
		//List<PageData> gatewayfaultList = faultService.listGatewayFault(page);	//获取列表
		mv.setViewName("street/power/powerstate_graph");
		//mv.addObject("gatewayfaultList", gatewayfaultList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC());
		
		return mv;
	}
	
	
	
}

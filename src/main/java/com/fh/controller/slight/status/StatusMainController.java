package com.fh.controller.slight.status;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.hzy.util.UserUtils;
import com.fh.service.slight.status.StatusMainService;
import com.fh.util.PageData;

/**
 * 
 * @author hongzhiyuanzj
 *
 */
@Controller
@RequestMapping("/status/main")
public class StatusMainController extends BaseController{
	
	@Resource(name="statusMainService")
	StatusMainService statusMainService;
	String statusMainJsp = "statusStrategy/state_main";
	
	@RequestMapping("/getMainData")
	public ModelAndView getMainData() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userid", UserUtils.getUserid());
		mv.addObject("groupAndStrategy", statusMainService.getStgAndGroupCnt(pd));
		mv.addObject("totalGateway", statusMainService.getGatewayTotal(pd));
		mv.addObject("normalGateway", statusMainService.getGatewayNormal(pd));
		mv.addObject("totalClient", statusMainService.getClientTotal(pd));
		mv.addObject("normalClient", statusMainService.getClientNormal(pd));
		pd.put("type", 3);
		mv.addObject("gatewayFault", statusMainService.getGatewayFaultCnt(pd));
		pd.put("type", 4);
		mv.addObject("cutoffFault", statusMainService.getGatewayFaultCnt(pd));
		mv.addObject("clientFault", statusMainService.getClientFaultCnt(pd));
		
		pd.put("state", 2);
		int v = Integer.valueOf(statusMainService.getGatewayFaultCnt(pd).getString("fgateway"))+Integer.valueOf(statusMainService.getClientFaultCnt(pd).getString("fclient"));
		mv.addObject("pressure", v);
		mv.setViewName(statusMainJsp);
		return mv;
	}
	
}

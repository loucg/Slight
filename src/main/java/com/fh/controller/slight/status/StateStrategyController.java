package com.fh.controller.slight.status;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.slight.status.StatusStrategyService;
import com.fh.util.PageData;

@Controller
@RequestMapping("/status/strategy")
public class StateStrategyController extends BaseController{
	
	private String strategyJsp = "stateStrategy/strategy_list";
	
	@Resource(name="statusStrategyService")
	public StatusStrategyService statusStrategyService;
	
	@RequestMapping("/getStrategyList")
	public ModelAndView getStrategyList() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list = statusStrategyService.getGroupList(pd);
		mv.addObject("strategyList", list);
		mv.setViewName(strategyJsp);
		return mv;
	}
	
}

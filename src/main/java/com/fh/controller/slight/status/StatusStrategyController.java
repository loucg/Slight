package com.fh.controller.slight.status;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.hzy.util.DateUtils;
import com.fh.hzy.util.UserUtils;
import com.fh.service.slight.status.StatusStrategyService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;


/**
 * 
 * @author hongzhiyuanzj
 *
 */

@Controller
@RequestMapping("/status/strategy")
public class StatusStrategyController extends BaseController{
	
	private String strategyJsp = "statusStrategy/strategy_list";
	
	@Resource(name="statusStrategyService")
	public StatusStrategyService statusStrategyService;
	
	@RequestMapping("/getGroupList")
	public ModelAndView getGroupList() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userid", UserUtils.getUserid());
		int type = 1;
		if(pd.getString("type")!=null){
			type = Integer.valueOf(pd.getString("type"));
		}
		
		if(pd.getString("starttime")==null||pd.getString("starttime").equals("")){
			pd.put("starttime", DateUtils.getCurrentDate());
		}else{
			pd.put("starttime", DateUtils.getDate(pd.getString("starttime")));
		}
		if(pd.getString("endtime")==null||pd.getString("endtime").equals("")){
			if(type==1)pd.put("endtime", DateUtils.getDefaultNextDay());
			if(type==2)pd.put("endtime", DateUtils.getDefaultNextMonth());
		}else{
			pd.put("endtime", DateUtils.getDate(pd.getString("endtime")));
		}
		List<PageData> tableList;
		if(type==1){
			tableList = statusStrategyService.getDayGroupList(pd);
		}else{
			tableList = statusStrategyService.getMonthGroupList(pd);
		}
		List<PageData> strategyList = statusStrategyService.getStrategyList(pd);
		if(strategyList.size()==0)mv.addObject("groupList", null);
		else{
			List<List<PageData>> groupList = new ArrayList<List<PageData>>();
			int table_number = tableList.size()/10+1;
			List<PageData> temp = null; 
			for(int i=0;i<table_number;i++){
				temp = new ArrayList<>();
				for(int j=0;j<10;j++){
					try{
						temp.add(tableList.get(j+10*i));
						
					}catch(Exception e){
						temp.add(new PageData());
					}
				}
				groupList.add(temp);
			}
			mv.addObject("groupList", groupList);
		}
		mv.addObject("QX", Jurisdiction.getHC());
		mv.addObject("pd", pd);
		
		mv.addObject("strategyList", strategyList);
		mv.setViewName(strategyJsp);
		return mv;
	}
	

}

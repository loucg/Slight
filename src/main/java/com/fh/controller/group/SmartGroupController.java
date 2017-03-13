package com.fh.controller.group;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.smartgroup.SmartGroupService;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * 智能分组
 * @author xiaozhou
 * 创建时间：2017年3月9日
 */
@Controller
@RequestMapping(value="/smartgroup")
public class SmartGroupController extends BaseController{

	String menuUrl = "smartgroup/groupPower.do"; //菜单地址(权限用)
    @Resource(name="smartGroupService")
    private SmartGroupService smartGroupService;
    
    
    
    
    /**功率分组
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/groupPower")
	public void groupPower(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"groupPower");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//查询灯是不是属于同一个电线杆，如果不是则无法进行功率分组
		long num = 0;
		PageData lamp = smartGroupService.getLampCount(pd);
		if(null !=lamp.get("num") && !"".equals(lamp.get("num"))){
			 num = (long)lamp.get("num");
			 System.out.println("num:"+num);
		}
		
		if(num == 1){
			//只有一个灯杆，进行智能分组
			out.write("success");  
			System.out.println("-----------");
		}
		
		
		out.close();
	}
    
    
    
    
	
	
}

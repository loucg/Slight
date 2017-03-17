package com.fh.controller.slight.weixiu;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.slight.weixiu.WeixiuService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;


/** 
 * 类名称：WeixiuController
 * 创建人：mxc
 * 创建时间：2017-03-01
 */
@Controller
@RequestMapping(value="/repair")
public class WeixiuController extends BaseController {
	
	String menuUrl = "repair/weixiu"; //菜单地址(权限用)
	@Resource(name="weixiuService")
	private WeixiuService weixiuService;
	
	private String weixiuJsp = "repair/weixiu/weixiu_list";  						//终端维修记录查询jsp
	private String weixiuEditJsp = "repair/weixiu/weixiu_edit";  					//终端维修登记修改jsp
	private String weixiuCreateJsp = "foundation/weixiu/weixiu_edit";
	private String saveRsultJsp = "save_result";  				//保存修改jsp
	
	
	/**
	 * 获取终端维修记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/weixiu")
	public ModelAndView getWeixiuList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	/*	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(pd.getString("Start")!=null){
			Date start = format.parse(pd.getString("Start"));
			pd.put("start", start);
			 
		} else{pd.put("Start", "2010-01-01");}
		if(pd.getString("End")!=null){
			Date end = format.parse(pd.getString("End"));
			pd.put("end", end);
		}*/
		/*else{
			pd.put("End", "2030-01-01");}*/
		page.setPd(pd);
		
		List<PageData> weixiuList = weixiuService.getWeixiuList(page);
		mv.addObject("pd", pd);
		
		mv.addObject("weixiuList", weixiuList);
		System.out.println(weixiuList);
		mv.setViewName(weixiuJsp);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


	/**
	 * 跳转终端维修记录修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goWeixiuEdit")
	public ModelAndView goWeixiuEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = weixiuService.getWeixiuById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editWeixiu");
		mv.setViewName(weixiuEditJsp);
		return mv;

	}
	

	/**
	 * 修改终端维修记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editWeixiu")
	public ModelAndView editWeixiu() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("tdate", new Date());//创建时间
		
		weixiuService.editWeixiu(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;

	}
 	
	 /**
	 * 跳转终端维修记录新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */ 
	@RequestMapping("/goWeixiuCreate")
	public ModelAndView goWeixiuCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = weixiuService.getWeixiuById(pd);
		/*pd.put("tdate", Tools.date2Str(new Date()));//创建时间
*/		mv.addObject("pd", pd);
		mv.addObject("msg", "createWeixiu");
		mv.setViewName(weixiuEditJsp);
		return mv;
	}
	
	 /**
	 * 新增终端维修记录
	 * @return
	 * @throws Exception
	 */ 
	@RequestMapping("/createWeixiu")
	public ModelAndView createWeixiu() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("tdate", Calendar.getInstance().getTime());//创建时间
		weixiuService.createWeixiu(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;

	} 
}

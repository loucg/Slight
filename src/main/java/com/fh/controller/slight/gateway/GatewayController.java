package com.fh.controller.slight.gateway;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.slight.gateway.GatewayService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
@RequestMapping("/repair")
public class GatewayController extends BaseController{
	String menuUrl = "repair/gateway"; //菜单地址(权限用)
	@Resource(name="gatewayService") 
	private GatewayService gatewayService;
	
	private String gatewayJsp = "repair/gateway/gateway_list";  						//网关维修记录查询jsp
	private String gatewayEditJsp = "repair/gateway/gateway_edit";  					//网关维修登记修改jsp
	private String gatewayCreateJsp = "foundation/gateway/gateway_edit";
	private String saveRsultJsp = "save_result";  				//保存修改jsp
	
	/**
	 * 获取网关维修记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/gateway")
	public ModelAndView getGatewayList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
/*		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(pd.getString("Start")!=null){
			Date start = format.parse(pd.getString("Start"));
			pd.put("start", start);
		}
		if(pd.getString("End")!=null){
			Date end = format.parse(pd.getString("End"));
			pd.put("end", end);
		}*/
		page.setPd(pd);
		List<PageData> nPList = gatewayService.getGatewayList(page);
		mv.addObject("pd", pd);
		
		mv.addObject("gatewayList", nPList);
		mv.setViewName(gatewayJsp);
		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


	/**
	 * 跳转网关维修修改页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goGatewayEdit")
	public ModelAndView goGatewayEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = gatewayService.getGatewayById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "editGateway");
		mv.setViewName(gatewayEditJsp);
		return mv;

	}
	

	/**
	 * 修改网关维修记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/editGateway")
	public ModelAndView editGateway() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("tdate", new Date());//创建时间
		gatewayService.editGateway(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;

	}
	
	 /**
	 * 跳转网关维修记录新增页面
	 * @param page
	 * @return
	 * @throws Exception
	 */ 
	@RequestMapping("/goGatewayCreate")
	public ModelAndView goGatewayCreate() throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = gatewayService.getGatewayById(pd);
		/*pd.put("tdate", Tools.date2Str(new Date()));//创建时间
*/		mv.addObject("pd", pd);
		mv.addObject("msg", "createGateway");
		mv.setViewName(gatewayEditJsp);
		return mv;
	}
	
	 /**
	 * 新增网关维修记录
	 * @return
	 * @throws Exception
	 */ 
	@RequestMapping("/createGateway")
	public ModelAndView createGateway() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("tdate", Calendar.getInstance().getTime());//创建时间
		gatewayService.createGateway(pd);
		mv.addObject("msg", "success");
		mv.setViewName(saveRsultJsp);
		return mv;

	}
 

}

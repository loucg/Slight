package com.fh.service.system.fhlog.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.hzy.util.UserUtils;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;

/** 
 * 说明： 操作日志记录
 * 创建人：FH Q313596790
 * 创建时间：2016-05-10
 * @version
 */
@Service("fhlogService")
public class FHlogService implements FHlogManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(String userid, String comment, int type)throws Exception{
		
		PageData pd = new PageData();
		pd.put("userid", userid);
		pd.put("type", type);
		pd.put("comment", comment);
		pd.put("time", Tools.date2Str(new Date()));
		dao.save("LogMapper.insertLog", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("FHlogMapper.delete", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		PageData pd = page.getPd();
		pd.put("userid", UserUtils.getUserid());
		pd = (PageData)dao.findForObject("RoleMapper.getRoleNameByUserid", pd);
		if(pd.getString("rolename").equals("超级管理员")){
			pd.put("userid", null);
		}else{
			pd.put("userid", UserUtils.getUserid());
		}
		
		return (List<PageData>)dao.findForList("LogMapper.getLoglistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		pd.put("userid", UserUtils.getUserid());
		pd = (PageData)dao.findForObject("RoleMapper.getRoleNameByUserid", pd);
		if(pd.getString("rolename").equals("超级管理员")){
			pd.put("userid", null);
		}else{
			pd.put("userid", UserUtils.getUserid());
		}
		
		return (List<PageData>)dao.findForList("LogMapper.getLogAllPage", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FHlogMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("FHlogMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> getLogTypeList(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("LogMapper.getLogTypeList", pd);
	}
	
	
}


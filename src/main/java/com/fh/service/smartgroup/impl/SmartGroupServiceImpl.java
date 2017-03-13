package com.fh.service.smartgroup.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.service.smartgroup.SmartGroupService;
import com.fh.util.PageData;

@Service("smartGroupService")
public class SmartGroupServiceImpl implements SmartGroupService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;


	/**
	 * 获取灯杆数
	 */
	public PageData getLampCount(PageData pd) throws Exception {
		return (PageData)dao.findForObject("SmartGroupMapper.LampCount", pd);
	}

	

}

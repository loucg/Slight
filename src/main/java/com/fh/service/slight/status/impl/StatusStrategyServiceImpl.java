package com.fh.service.slight.status.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.service.slight.status.StatusStrategyService;
import com.fh.util.PageData;

@Service("statusStrategyService")
public class StatusStrategyServiceImpl implements StatusStrategyService{

	@Resource(name="daoSupport")
	DaoSupport dao;
	
	@Override
	public List<PageData> getGroupList(PageData pd) throws Exception{
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("StatusStrategyMapper.getDayGroup", pd);
	}
	
}

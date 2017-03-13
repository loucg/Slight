package com.fh.service.street.fault.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.street.fault.FaultService;
import com.fh.util.PageData;

@Service("faultService")
public class FaultServiceImpl implements FaultService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listGatewayFault(Page page) throws Exception {
		return (List<PageData>)dao.findForList("FaultMapper.gatewayfaultlistPage", page);
	}

	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listLampFault(Page page) throws Exception {
		return (List<PageData>)dao.findForList("FaultMapper.lampfaultlistPage", page);
	}

	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listVoFault(Page page) throws Exception {
		return (List<PageData>)dao.findForList("FaultMapper.vofaultlistPage", page);
	}

}

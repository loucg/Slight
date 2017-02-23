package com.fh.service.street.state.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.street.state.GatewayStateService;
import com.fh.util.PageData;

@Service("gatewayStateService")
public class GatewayStateServiceImpl implements GatewayStateService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listGatewayState(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GatewayStateMapper.gatewaystatelistPage", page);
	}

}

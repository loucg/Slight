package com.fh.service.group.mem.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.group.mem.GroupMemService;
import com.fh.util.PageData;

@Service("groupMemService")
public class GroupMemServiceImpl implements GroupMemService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 已分组列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listMem(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GroupMemMapper.memlistPage", page);
	}

	/**
	 * 未分组成员列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listOthers(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GroupMemMapper.otherlistPage", page);
	}

	/**
	 * 添加组成员
	 */
	public void addMember(PageData pd) throws Exception {
		dao.save("GroupMemMapper.addMember", pd);
	}

	/**
	 * 踢删组员
	 */
	public void removeMember(PageData pd) throws Exception {
		dao.delete("GroupMemMapper.removeMember", pd);
	}

}

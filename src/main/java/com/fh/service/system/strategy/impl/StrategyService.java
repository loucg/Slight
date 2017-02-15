package com.fh.service.system.strategy.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.Strategy;
import com.fh.service.system.strategy.StrategyManager;
import com.fh.util.PageData;

/**	控制策略
 * @author zjc
 * 修改日期：2017.1.29
 */
@Service("strategyService")
public class StrategyService implements StrategyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**策略列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listStrategys(Page page) throws Exception {
		return (List<PageData>) dao.findForList("StrategyMapper.strategylistPage", page);
	}
	
	/**通过id查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findObjectById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("StrategyMapper.findObjectById", pd);
	}
	
	/**添加
	 * @param pd
	 * @throws Exception
	 */
	public void add(PageData pd) throws Exception {
		dao.save("StrategyMapper.insert", pd);
	}
	
	/**保存修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("StrategyMapper.edit", pd);
	}
	
	/**删除策略
	 * @param id
	 * @throws Exception
	 */
	public void deleteStrategyById(String id) throws Exception {
		dao.delete("StrategyMapper.deleteStrategyById", id);
	}
	
	/**通过id查找
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Strategy getStrategyById(String id) throws Exception {
		return (Strategy) dao.findForObject("StrategyMapper.getStrategyById", id);
	}

}

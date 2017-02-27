package com.fh.service.strategy;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.system.Strategy;
import com.fh.util.PageData;

/**	控制策略类
 * @author zjc
 * 修改日期：2017.1.29
 */
public interface StrategyManager {
	
	/**策略列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listStrategys(Page page) throws Exception;
	
	/**通过id查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**添加策略
	 * @param pd
	 * @throws Exception
	 */
	public void addStrategy(PageData pd) throws Exception;
	
	/**保存修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	
	/**删除策略
	 * @param id
	 * @throws Exception
	 */
	public void deleteStrategyById(String id) throws Exception;
		
	/**通过id查找
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Strategy getStrategyById(String id) throws Exception;
		
}

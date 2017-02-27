package com.fh.service.slight.status;

import java.util.List;

import com.fh.util.PageData;

/**
 * 亮灯统计分组配置接口
 * @author hongzhiyuanzj
 *
 */
public interface StatusStrategyService {
	
	/**
	 * 获取分组策略的信息列表
	 * @return
	 */
	public List<PageData> getGroupList(PageData pd) throws Exception;
}

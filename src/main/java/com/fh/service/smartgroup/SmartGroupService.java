package com.fh.service.smartgroup;

import com.fh.util.PageData;

/**
 * 智能分组的接口
 * @author xiaozhou
 *
 */
public interface SmartGroupService {

	/**
	 * 获取该分组下的灯杆的数量
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	PageData getLampCount(PageData pd)throws Exception;

	

}

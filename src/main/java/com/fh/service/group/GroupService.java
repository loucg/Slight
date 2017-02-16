package com.fh.service.group;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 分组配置的接口
 * @author xiaozhou
 *
 */
public interface GroupService {

	/**
	 * 获取分组后的组列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<PageData> listGroup(Page page)throws Exception;

	/**
	 * 根据id获取分组信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	PageData findById(PageData pd)throws Exception;

	/**
	 * 新增分组
	 * @param pd
	 * @throws Exception
	 */
	void addGroup(PageData pd)throws Exception;

	/**
	 * 更新分组
	 * @param pd
	 * @throws Exception
	 */
	void updateGroup(PageData pd)throws Exception;

	/**
	 * 根据用户名获取sys_user_id
	 * @param username
	 * @return
	 */
	//String getUserId(String username);

}

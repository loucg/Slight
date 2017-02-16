package com.fh.service.group.mem;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 分组配置的接口
 * @author xiaozhou
 *
 */
public interface GroupMemService {

	/**
	 * 获取分组后的组列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<PageData> listMem(Page page)throws Exception;

	/**
	 * 获取未分组的成员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<PageData> listOthers(Page page)throws Exception;

	/**
	 * 添加组成员
	 * @param pd
	 * @throws Exception
	 */
	void addMember(PageData pd) throws Exception;

	/**
	 * 踢删组员
	 * @param pd
	 * @throws Exception
	 */
	void removeMember(PageData pd) throws Exception;

}

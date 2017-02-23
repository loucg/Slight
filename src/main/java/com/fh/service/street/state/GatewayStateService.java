package com.fh.service.street.state;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 路灯状态-网关状态列表的接口
 * @author xiaozhou
 *
 */
public interface GatewayStateService {

	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<PageData> listGatewayState(Page page)throws Exception;

}

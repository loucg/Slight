package com.fh.service.street.fault;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 路灯状态-故障列表的接口
 * @author xiaozhou
 *
 */
public interface FaultService {

	/**
	 * 获取网关列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<PageData> listGatewayFault(Page page)throws Exception;

	/**
	 * 获取路灯列表
	 * @param page
	 * @return
	 */
	List<PageData> listLampFault(Page page)throws Exception;

}

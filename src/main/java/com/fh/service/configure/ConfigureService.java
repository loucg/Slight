package com.fh.service.configure;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 基础配置类接口
 * @author hongzhiyuanzj
 *
 */
public interface ConfigureService {
	
	
	/**
	 * 获得普通电源列表
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> getNPowerList(Page page) throws Exception;
	
	/**
	 * 修改普通电源
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void editNPower(PageData pd) throws Exception;
	
	
	/**
	 * 新增普通电源
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void createNPower(PageData pd) throws Exception;
	
	/**
	 * 获取灯信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getLampList(Page page) throws Exception;
	
	/**
	 * 修改灯信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void editLamp(PageData pd) throws Exception;
	
	/**
	 * 新增灯信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void createLamp(PageData pd) throws Exception;
	
	/**
	 * 获取传感器列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getSensorList(Page page) throws Exception;
	
	/**
	 * 修改传感器信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void editSensor(PageData pd) throws Exception;
	
	/**
	 * 新增传感器信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void createSensor(PageData pd) throws Exception;
	
	/**
	 * 获取灯杆列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getPoleList(Page page) throws Exception;
	
	/**
	 * 修改灯杆信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void editPole(PageData pd) throws Exception;
	
	/**
	 * 新增灯杆信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void createPole(PageData pd) throws Exception;
	
	/**
	 * 获取sim卡列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getSimList(Page page) throws Exception;
	
	/**
	 * 修改sim卡信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void editSim(PageData pd) throws Exception;
	
	/**
	 * 新增sim卡信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void createSim(PageData pd) throws Exception;

	/**
	 * 获取一体化电源和单灯控制器
	 * @return
	 */
	public List<PageData> getDeviceList(Page page) throws Exception;
	
	/**
	 * 获取网关、断路器、普通断路器
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getGatewayList(Page page) throws Exception;
	
	/**
	 * 修改一体化电源和单灯控制器
	 * @param pd
	 * @throws Exception
	 */
	public void editDevice(PageData pd) throws Exception;
	
	/**
	 * 新增一体化电源和单灯控制器
	 * @param pd
	 * @throws Exception
	 */
	public void createDevice(PageData pd) throws Exception;
	
	/**
	 * 修改网关、断路器、普通断路器
	 * @param pd
	 * @throws Exception
	 */
	public void editGateway(PageData pd) throws Exception;
	
	/**
	 * 新增网关 、断路器、普通断路器
	 * @param pd
	 * @throws Exception
	 */
	public void createGateway(PageData pd) throws Exception;
	
	/**
	 * 获取类型列表
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDeviceType(PageData pd) throws Exception;
	
	
}

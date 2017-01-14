package com.fh.service.configure.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.configure.ConfigureService;
import com.fh.util.PageData;

@Service("configureService")
public class ConfigureSerivceImpl implements ConfigureService{

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	
	@Override
	public List<PageData> getNPowerList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getNPowerPage", page);
	}


	@Override
	public void editNPower(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ConfigureMapper.editNPower", pd);
	}


	@Override
	public void createNPower(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ConfigureMapper.createNPower", pd);
	}


	@Override
	public List<PageData> getLampList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getLampPage", page);
	}


	@Override
	public void editLamp(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ConfigureMapper.editLamp", pd);
	}


	@Override
	public void createLamp(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ConfigureMapper.createLamp", pd);
	}


	@Override
	public List<PageData> getSensorList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getSensorPage", page);
	}


	@Override
	public void editSensor(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ConfigureMapper.editSensor", pd);
	}


	@Override
	public void createSensor(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ConfigureMapper.createSensor", pd);
	}


	@Override
	public List<PageData> getPoleList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getPolePage", page);
	}


	@Override
	public void editPole(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ConfigureMapper.editPole", pd);
	}


	@Override
	public void createPole(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ConfigureMapper.createPole", pd);
	}


	@Override
	public List<PageData> getSimList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getSimPage", page);
	}


	@Override
	public void editSim(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ConfigureMapper.editSim", pd);
	}


	@Override
	public void createSim(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ConfigureMapper.createSim", pd);
	}


	@Override
	public List<PageData> getDeviceList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getDevicelistPage", page);
	}

	@Override
	public List<PageData> getGatewayList(Page page) throws Exception {
		
		return (List<PageData>)dao.findForList("ConfigureMapper.getGatewaylistPage", page);
	}


	@Override
	public void editDevice(PageData pd) throws Exception {
		dao.update("ConfigureMapper.editDevice", pd);
	}


	@Override
	public void createDevice(PageData pd) throws Exception {
		dao.save("ConfigureMapper.insertClient", pd);
		int lastid = (Integer)dao.findForObject("ConfigureMapper.lastInsertId", pd);
		pd.put("id", lastid);
		dao.save("ConfigureMapper.insertClientAttr1", pd);
		dao.save("ConfigureMapper.insertClientAttr2", pd);
	}


	@Override
	public void editGateway(PageData pd) throws Exception {
		dao.save("ConfigureMapper.editGateway", pd);
	}


	@Override
	public void createGateway(PageData pd) throws Exception {
		dao.save("ConfigureMapper.insertGateway", pd);
		int lastid = (Integer)dao.findForObject("ConfigureMapper.lastInsertId", pd);
		pd.put("id", lastid);
		dao.save("ConfigureMapper.insertGatewayAttr1", pd);
		dao.save("ConfigureMapper.insertGatewayAttr2", pd);
	}


	@Override
	public List<PageData> getDeviceType(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ConfigureMapper.getDeviceType", pd);
	}


	@Override
	public List<PageData> getAllNPower() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PageData> getAllLamp() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PageData> getAllPole() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PageData> getAllSensor() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<PageData> getAllSim() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}

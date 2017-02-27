package com.fh.service.map.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.map.c_client;
import com.fh.entity.map.c_term;
import com.fh.entity.system.Status;
import com.fh.service.map.C_clientManager;
import com.fh.service.system.status.StatusManager;
import com.fh.util.PageData;

/**	地图控制
 * @author zjc
 * 修改日期：2017.1.29
 */
@Service("c_clientService")
public class C_clientService implements C_clientManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
    @SuppressWarnings("unchecked")
	@Override
	public List<c_term> queryAllterm() throws Exception {
		c_term a=new c_term();
		return  (List<c_term>)dao.findForList("C_clientMapper.queryAllterm",a);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<c_client> queryAllterm_client(c_client p) throws Exception  {
		return  (List<c_client>)dao.findForList("C_clientMapper.queryAllterm_client",p);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<c_client> addClientMaker(c_client cc) throws Exception  {
		
		 List<c_client> adm=(List<c_client>)dao.findForList("C_clientMapper.queryAllclient_status",cc);
		 c_client c=new c_client();
		 for(int i=0;i<adm.size();i++){
			 c=adm.get(i);
			 String coordinate=c.getCoordinate();
			 coordinate=coordinate.trim();
			 coordinate=coordinate.replace(" ","");
			 String[] coordsplit = coordinate.split(",");
			 double xcoordinate=Double.parseDouble(coordsplit[0]);
			 double ycoordinate=Double.parseDouble(coordsplit[1]);
			 c.setCoordinate(coordinate);
			 c.setXcoordinate(xcoordinate);
			 c.setYcoordinate(ycoordinate);
			 }
		return  adm;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getTypenameByGroup(int groupname)  throws Exception {
		return  (List<c_client>)dao.findForList("C_clientMapper.getTypenameByGroup",groupname);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getAddressByType(c_client cc) throws Exception  {
		return  (List<c_client>)dao.findForList("C_clientMapper.getAddressByType",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getClientnameByaddress(c_client cc)  throws Exception {
		return  (List<c_client>)dao.findForList("C_clientMapper.getClientnameByaddress",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getClientigByname(c_client cc)  throws Exception {
		return  (List<c_client>)dao.findForList("C_clientMapper.getClientigByname",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getSearchClient(c_client cc1)  throws Exception {
		List<c_client> scl= (List<c_client>)dao.findForList("C_clientMapper.getSearchClient",cc1);
		 c_client cc=new c_client();
		 for(int i=0;i<scl.size();i++){
			 cc=scl.get(i);
			 String coordinate=cc.getCoordinate();
			 coordinate=coordinate.trim();
			 coordinate=coordinate.replace(" ","");
			 String[] coordsplit = coordinate.split(",");
			 double xcoordinate=Double.parseDouble(coordsplit[0]);
			 double ycoordinate=Double.parseDouble(coordsplit[1]);
			 cc.setCoordinate(coordinate);
			 cc.setXcoordinate(xcoordinate);
			 cc.setYcoordinate(ycoordinate);
			 }
		return scl;
	}

	@Override
	@SuppressWarnings("unchecked")
	public void updateClientAttr_brightness(c_client cc) throws Exception  {
		dao.update("C_clientMapper.updateClientAttr_brightness", cc);
		
	}
	@Override
	@SuppressWarnings("unchecked")
	public int queryCountterm_client(c_client p) throws Exception  {
		return  (Integer)dao.findForObject("C_clientMapper.queryCountterm_client",p);
	}
	
	@Override
	public void updateClientAttr_status(c_client cc) throws Exception {
		if("正常".equals(cc.getStatus())){
			updateClientAttr_statusOff(cc);
		}else
		{
			updateClientAttr_statusON(cc);	
		}
	}
	@Override
	@SuppressWarnings("unchecked")
	public void updateClientAttr_statusON(c_client cc) throws Exception  {
		dao.update("C_clientMapper.updateClientAttr_statusON", cc);
		
	}
	@Override
	@SuppressWarnings("unchecked")
	public void updateClientAttr_statusOff(c_client cc) throws Exception  {
		dao.update("C_clientMapper.updateClientAttr_statusOff", cc);
		
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> queryAllterm_gateway(c_client p) throws Exception  {	
		List<c_client> qtg= (List<c_client>)dao.findForList("C_clientMapper.queryAllterm_gateway",p);
		c_client c=new c_client();
		 for(int i=0;i<qtg.size();i++){
			 c=qtg.get(i);
			 String coordinate=c.getCoordinate();
			 coordinate=coordinate.trim();
			 coordinate=coordinate.replace(" ","");
			 String[] coordsplit = coordinate.split(",");
			 double xcoordinate=Double.parseDouble(coordsplit[0]);
			 double ycoordinate=Double.parseDouble(coordsplit[1]);
			 c.setCoordinate(coordinate);
			 c.setXcoordinate(xcoordinate);
			 c.setYcoordinate(ycoordinate);
			 }
		return qtg;
	}
	@Override
	@SuppressWarnings("unchecked")
	public int queryCountgateway(c_client p)  throws Exception {
		return  (int)dao.findForObject("C_clientMapper.queryCountgateway",p);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getTypenameByGroupGateway(int groupnameid) throws Exception  {
		return  (List<c_client>)dao.findForList("C_clientMapper.getTypenameByGroupGateway",groupnameid);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getAddressByTypeGataway(c_client cc)  throws Exception {
		return  (List<c_client>)dao.findForList("C_clientMapper.getAddressByTypeGataway",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getClientnameByaddressGateway(c_client cc) throws Exception  {
		return  (List<c_client>)dao.findForList("C_clientMapper.getClientnameByaddressGateway",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getClientigBynameGateway(c_client cc) throws Exception  {
		return  (List<c_client>)dao.findForList("C_clientMapper.getClientigBynameGateway",cc);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<c_client> getSearchGateway(c_client cc1) throws Exception  {
		List<c_client> gcl= (List<c_client>)dao.findForList("C_clientMapper.getSearchGateway",cc1);
		 c_client cc=new c_client();
		 for(int i=0;i<gcl.size();i++){
			 cc=gcl.get(i);
			 String coordinate=cc.getCoordinate();
			 coordinate=coordinate.trim();
			 coordinate=coordinate.replace(" ","");
			 String[] coordsplit = coordinate.split(",");
			 double xcoordinate=Double.parseDouble(coordsplit[0]);
			 double ycoordinate=Double.parseDouble(coordsplit[1]);
			 cc.setCoordinate(coordinate);
			 cc.setXcoordinate(xcoordinate);
			 cc.setYcoordinate(ycoordinate);
			 }
		return gcl;
	}
	
}

package com.monitor.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import com.monitor.dao.CampanaDao;
import com.monitor.filter.FiltrosCampana;
import com.monitor.model.dto.CampanaDTO;
import com.monitor.util.*;

public class CampanaService {
	private EntityManager entityManager;
	private CampanaDao campanaDao;
	private Util util;

	public CampanaService(EntityManager entityManager) {
		// TODO Auto-generated constructor stub
		this.entityManager = entityManager;
		campanaDao = new CampanaDao(entityManager);
		util= new Util();
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public ArrayList<CampanaDTO> consultaCampanasActivas(String cveClipro) {
		ArrayList<Object[]> campanaList=(ArrayList<Object[]>)campanaDao.consultaCampanasActivas(cveClipro);
		ArrayList<CampanaDTO> campanaDTOList = util.getCampanaDTO(campanaList);		
		return campanaDTOList;
	}
}

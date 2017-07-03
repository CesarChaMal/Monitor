package com.monitor.service;

import java.util.ArrayList;
import javax.persistence.EntityManager;
import com.monitor.dao.SitioDao;
import com.monitor.model.dto.SitioDTO;
import com.monitor.util.Util;

public class SitioService {
	private EntityManager entityManager;
	private SitioDao sitioDao;
	private Util util;
	public SitioService(EntityManager entityManager) {
		this.entityManager = entityManager;
		sitioDao = new SitioDao(entityManager);
		util = new Util();
	}

	public ArrayList<SitioDTO> consultaSitiosActivos(String cveClipro) {
		ArrayList<Object[]> sitioList = (ArrayList<Object[]>)sitioDao.consultaSitiosActivos(cveClipro);
		ArrayList<SitioDTO> sitioDTOList = util.getSitioDTO(sitioList);		
		return sitioDTOList;
	}
}

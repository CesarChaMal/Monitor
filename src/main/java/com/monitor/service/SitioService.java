package com.monitor.service;

import java.util.ArrayList;
import javax.persistence.EntityManager;
import com.monitor.dao.SitioDao;
import com.monitor.filter.FiltrosSitios;
import com.monitor.filter.FiltrosUsuario;
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
		ArrayList<SitioDTO> sitioDTOList = util.getSitiosDTO(sitioList);		
		return sitioDTOList;
	}
	
	
	public void eliminaUsuario(FiltrosSitios filtrosSitios) throws Exception {
		sitioDao.eliminaSitio(filtrosSitios);
	}
	
	
	
	public void actualizaSitio(FiltrosSitios filtrosSitios) throws Exception {
		sitioDao.actualizaUsuario(filtrosSitios);
	}
}

package com.monitor.service;

import java.util.ArrayList;
import javax.persistence.EntityManager;
import com.monitor.dao.SitioDao;
import com.monitor.filter.FiltrosSitios;
import com.monitor.filter.FiltrosUsuario;
import com.monitor.model.dto.SitioDTO;
import com.monitor.model.dto.UsuarioDTO;
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
		return util.getSitioDTO(sitioList);
	}
	
	public <T> ArrayList<SitioDTO> consultarSitios(FiltrosSitios filtrosSitios) throws Exception {
		ArrayList<T[]> sitiosList = (ArrayList<T[]>)sitioDao.consultar(filtrosSitios);
		return util.getSitiosDTO(sitiosList);
	}
	
	public <T> ArrayList<SitioDTO> consultarTreeSitios(FiltrosSitios filtrosSitios) throws Exception {
		ArrayList<T[]> sitiosList = (ArrayList<T[]>)sitioDao.consultarTree(filtrosSitios);
		return util.getSitiosTreeDTO(sitiosList);
	}
	
	public void eliminaSitio(FiltrosSitios filtrosSitios) throws Exception {
		sitioDao.eliminar(filtrosSitios);
	}
	
	public void actualizaSitio(FiltrosSitios filtrosSitios) throws Exception {
		sitioDao.actualizar(filtrosSitios);
	}
}

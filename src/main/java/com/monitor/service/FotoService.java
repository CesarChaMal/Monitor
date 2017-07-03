package com.monitor.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import com.monitor.dao.FotoDao;
import com.monitor.filter.FiltrosMonitor;
import com.monitor.model.Foto;

public class FotoService {
	private EntityManager entityManager;
	private FotoDao fotoDao;
	
	public FotoService(EntityManager entityManager) {
		this.entityManager = entityManager;
		fotoDao = new FotoDao(entityManager);
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public ArrayList<Foto> obtenerFotosPorUsuario(FiltrosMonitor filtrosMonitor) throws Exception {
		return (ArrayList<Foto>)fotoDao.obtenerFotosPorUsuario(filtrosMonitor);
	}

}

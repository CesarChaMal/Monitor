package com.monitor.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.FiltrosSitios;

public class SitioDao {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UsuarioDao.class);
	private EntityManager entityManager;

	public SitioDao(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public List consultaSitiosActivos(String cveClipro) {
		Query q = entityManager.createQuery(
				"SELECT count(f.id.cveSitio), s.id.cveSitio,s.ubicacion from Sitio as s LEFT JOIN  Foto as f ON (s.id.cveSitio = f.id.cveSitio)  WHERE (s.status=1 and s.id.cveClipro=:cveClipro) group by f.id.cveSitio,s.id.cveSitio,s.ubicacion order by s.ubicacion desc");
		q.setParameter("cveClipro", cveClipro);
		return q.getResultList();
	}
	
	
	
	public void eliminaSitio(FiltrosSitios filtrosSitios) throws Exception {
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("delete from sitio where id = combinacion");
		
		try {
			q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
			q.setParameter("email", Arrays.asList(filtrosSitios.getEmail()));
			q.executeUpdate();
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.getStackTrace();
			LOGGER.error(e.getMessage());
			entityManager.getTransaction().rollback();
		}
	}

	public void actualizaUsuario(FiltrosSitios filtrosSitios) throws Exception {
		// TODO Auto-generated method stub
		
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("update Sitio set");
		
		//////el codigo que nesecuitaes
		
		try {
		
		q.executeUpdate();
		entityManager.getTransaction().commit();
	} catch (Exception e) {
		LOGGER.error(e.getMessage());
		e.getStackTrace();
		entityManager.getTransaction().rollback();
	}

		
		
	}
	
}

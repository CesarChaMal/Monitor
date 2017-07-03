package com.monitor.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class SitioDao {
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
}

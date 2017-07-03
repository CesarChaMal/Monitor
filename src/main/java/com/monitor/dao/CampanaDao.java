package com.monitor.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class CampanaDao {
	private EntityManager entityManager;
	public CampanaDao(EntityManager entityManager) {
		// TODO Auto-generated constructor stub
		this.entityManager = entityManager;
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public List consultaCampanasActivas(String cveClipro) {
		Query q = entityManager.createQuery(
				"SELECT count(f.id.cvePlaza), c.id.cveCampana,c.nombre FROM Campana as c LEFT JOIN Foto as f on (c.id.cveCampana = f.id.cveCampana) WHERE (c.status=1 and c.id.cveClipro=:cveClipro) group by f.id.cveCampana,c.id.cveCampana,c.nombre  order by c.nombre desc");
		q.setParameter("cveClipro", cveClipro);
		return q.getResultList();
	}
}

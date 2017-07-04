package com.monitor.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.Filtros;
import com.monitor.filter.FiltrosSitios;
import com.monitor.model.CliPro;

public class SitioDao implements MonitorDao {
	
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
	
	@Override
	public List consultar(Filtros filtrosSitios) throws Exception {
		entityManager.clear();

		Query q = null;
		StringBuffer queryString = new StringBuffer("select cl, s, c, p");
		queryString.append(" from CliPro cl ");
		queryString.append(" inner join Campana as c on cl.cveClipro = c.id.cveClipro");
		queryString.append(" inner join Sitio as s on s.id.cveClipro = c.cliPro.cveClipro AND s.id.cveCampana = c.id.cveCampana");
		queryString.append(" inner join Plaza as p on p.cvePlaza= s.id.cvePlaza");

		if (((FiltrosSitios) filtrosSitios).getCveClipro() != null && ((FiltrosSitios) filtrosSitios).getCveClipro().length() > 0) {
			queryString.append(" where ");
			queryString.append(" lower(c.id.cveClipro) like lower(:cliente) ");
		}
		
		queryString.append(" order by s.id.cveSitio");

		q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);

		if (((FiltrosSitios) filtrosSitios).getCveClipro() != null && ((FiltrosSitios) filtrosSitios).getCveClipro().length() > 0) {
			CliPro clipro = new CliPro();
			clipro.setCveClipro(((FiltrosSitios) filtrosSitios).getCveClipro()+"%");
			q.setParameter("cliente", Arrays.asList(clipro));
		}
		
		return q.getResultList();
	}

	public List consultarTree(Filtros filtrosSitios) throws Exception {
		entityManager.clear();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("SELECT  MAX(c.CVE_CLIPRO) CVE_CLIPRO, MAX(c.NOMBRE) CLIPRO, MAX(p.CVE_PLAZA) CVE_PLAZA, MAX(p.NOMBRE) PLAZA, MAX(c.CVE_CAMPANA) CVE_CAMPANA, MAX(c.NOMBRE) CAMPANA, MAX(s.CVE_SITIO) CVE_SITIO, COUNT(*) AS num_rows");
		queryString.append(" FROM (SELECT ccl.CVE_CLIPRO, ccl.NOMBRE FROM monitor.CLI_PRO ccl");

		if (((FiltrosSitios) filtrosSitios).getCveClipro() != null && ((FiltrosSitios) filtrosSitios).getCveClipro().length() > 0) {
			queryString.append(" WHERE ");
			queryString.append(" LOWER(ccl.CVE_CLIPRO) LIKE LOWER(:cliente)");
		}
		
		queryString.append(") cl");
		queryString.append(") cl");

		queryString.append(" INNER JOIN monitor.CAMPANA c ON  cl.CVE_CLIPRO = c.CVE_CLIPRO");
		queryString.append(" INNER JOIN monitor.SITIO s ON s.CVE_CLIPRO = c.CVE_CLIPRO AND s.CVE_CAMPANA = c.CVE_CAMPANA"); 
		queryString.append(" INNER JOIN monitor.PLAZA p ON p.CVE_PLAZA = s.CVE_PLAZA");
		queryString.append(" GROUP BY");

		if ( ((FiltrosSitios) filtrosSitios).getOrden() != null && ( ((FiltrosSitios) filtrosSitios).getOrden() >= 0) && ((FiltrosSitios) filtrosSitios).getOrden() <= 2 )  {
			Integer order = ((FiltrosSitios) filtrosSitios).getOrden();
			
			switch (order) {
			case 1:
				queryString.append(" p.CVE_PLAZA,");
				break;
			case 2:
				queryString.append(" c.CVE_CAMPANA,");
				break;
			default:
				queryString.append(" p.CVE_PLAZA,");
				break;
			}
		}
		queryString.append(" s.CVE_SITIO");
		queryString.append(" ORDER BY MAX(s.CVE_SITIO)");
		
		q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
		if (((FiltrosSitios) filtrosSitios).getCveClipro() != null && ((FiltrosSitios) filtrosSitios).getCveClipro().length() > 0) {
			CliPro clipro = new CliPro();
			clipro.setCveClipro(((FiltrosSitios) filtrosSitios).getCveClipro()+"%");
			q.setParameter("cliente", Arrays.asList(clipro));
		}
		
		return q.getResultList();
	}
	
	@Override
	public void eliminar(Filtros filtrosSitios) throws Exception {
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("update Sitio set");
		queryString.append(" status = 2 ");
		queryString.append(" where cve_sitio = :cve_sitio");
		
		try {
			q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
			q.setParameter("cve_sitio", Arrays.asList(((FiltrosSitios) filtrosSitios).getCveSitio()));
			
			q.executeUpdate();
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			e.getStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	@Override
	public void actualizar(Filtros filtrosSitios) throws Exception {
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("update Campana set");
		
		if (((FiltrosSitios) filtrosSitios).getUbicacion()!= null && ((FiltrosSitios) filtrosSitios).getUbicacion().length() > 0) {
			queryString.append(" ubicacion = :ubicacion,");
		}
		if (((FiltrosSitios) filtrosSitios).getIluminacion()!= null && (((FiltrosSitios) filtrosSitios).getIluminacion() > 0 && ((FiltrosSitios) filtrosSitios).getIluminacion() < 3)) {
			queryString.append(" iluminacion = :iluminacion,");
		}
		if (((FiltrosSitios) filtrosSitios).getStatus()!= null && (((FiltrosSitios) filtrosSitios).getStatus() > 0 && ((FiltrosSitios) filtrosSitios).getStatus() < 3)) {
			queryString.append(" status = :status ");
		}
		queryString.append(" where cve_sitio = :cve_sitio");
		
		try {
			q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
			
			if (((FiltrosSitios) filtrosSitios).getUbicacion()!= null && ((FiltrosSitios) filtrosSitios).getUbicacion().length() > 0) {
				q.setParameter("ubicacion", Arrays.asList(((FiltrosSitios) filtrosSitios).getUbicacion()));
			}
			if (((FiltrosSitios) filtrosSitios).getIluminacion()!= null && (((FiltrosSitios) filtrosSitios).getIluminacion() > 0 && ((FiltrosSitios) filtrosSitios).getIluminacion() < 3)) {
				q.setParameter("iluminacion", Arrays.asList(((FiltrosSitios) filtrosSitios).getIluminacion()));
			}
			if (((FiltrosSitios) filtrosSitios).getStatus()!= null && (((FiltrosSitios) filtrosSitios).getStatus() > 0 && ((FiltrosSitios) filtrosSitios).getStatus() < 3)) {
				q.setParameter("status", Arrays.asList(((FiltrosSitios) filtrosSitios).getCveSitio()));
			}
			q.setParameter("cve_sitio", Arrays.asList(((FiltrosSitios) filtrosSitios).getCveSitio()));
			
			q.executeUpdate();
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			e.getStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
}

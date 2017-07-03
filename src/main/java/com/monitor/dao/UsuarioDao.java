package com.monitor.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.FiltrosUsuario;
import com.monitor.model.CliPro;

public class UsuarioDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(UsuarioDao.class);
	private EntityManager entityManager;

	public UsuarioDao(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public List consultarUsuarios(FiltrosUsuario filtrosUsuario) throws Exception {
		entityManager.clear();

		Query q = null;
		StringBuffer queryString = new StringBuffer("select u,cl from Usuario as u inner join CliPro as cl on (u.id.cliPro=cl.cveClipro)");

		if (filtrosUsuario.getCveClipro() != null && filtrosUsuario.getCveClipro().length() > 0) {
			queryString.append(" and ");
			queryString.append(" lower(u.id.cliPro) like lower(:cliente)");
		}
		queryString.append(" order by fechaalta ASC");
		
		q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
		if (filtrosUsuario.getCveClipro() != null && filtrosUsuario.getCveClipro().length() > 0) {
			CliPro clipro = new CliPro();
			clipro.setCveClipro("%"+filtrosUsuario.getCveClipro()+"%");
			
			q.setParameter("cliente", Arrays.asList(clipro));
		}
		
		return q.getResultList();
	}
	
	public void eliminaUsuario(FiltrosUsuario filtrosUsuario) throws Exception {
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("delete from Usuario where email = :email");
		
		try {
			q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
			q.setParameter("email", Arrays.asList(filtrosUsuario.getEmail()));
			q.executeUpdate();
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.getStackTrace();
			LOGGER.error(e.getMessage());
			entityManager.getTransaction().rollback();
		}
	}
	
	public void actualizaUsuario(FiltrosUsuario filtrosUsuario) throws Exception {
		entityManager.clear();
		entityManager.getTransaction().begin();
		
		Query q = null;
		StringBuffer queryString = new StringBuffer("update Usuario set");
		
/*
		if (filtrosUsuario.getCveClipro()!= null && filtrosUsuario.getCveClipro().length() > 0) {
			queryString.append(" cveClipro = :cliente, ");
		}
		if (filtrosUsuario.getCveCliproNombre()!= null && filtrosUsuario.getCveCliproNombre().length() > 0) {
			queryString.append(" nombre = :clienteNombre, ");
		}
		
		if (filtrosUsuario.getEmail()!= null && filtrosUsuario.getEmail().length() > 0) {
			queryString.append(" email = :email,");
		}
 */		
		if (filtrosUsuario.getNombre()!= null && filtrosUsuario.getNombre().length() > 0) {
			queryString.append(" nombre = :nombre,");
		}
		if (filtrosUsuario.getApellidos()!= null && filtrosUsuario.getApellidos().length() > 0) {
			queryString.append(" apellidos = :apellidos,");
		}
		if (filtrosUsuario.getContrasena()!= null && filtrosUsuario.getContrasena().length() > 0) {
			queryString.append(" contrasena = :contrasena,");
		}
		if (filtrosUsuario.getFechaAlta()!= null) {
			queryString.append(" fechaalta = :fechaalta,");
		}
		if (filtrosUsuario.getTipo()!= null && (filtrosUsuario.getTipo() > 0 && filtrosUsuario.getTipo() < 4)) {
			queryString.append(" tipo = :tipo,");
		}
		if (filtrosUsuario.getStatus()!= null && (filtrosUsuario.getStatus() > 0 && filtrosUsuario.getStatus() < 3)) {
			queryString.append(" status = :status ");
		}
		
		try {
			q = entityManager.createQuery(queryString.toString()).setHint("org.hibernate.cacheable", Boolean.FALSE);
/*
			if (filtrosUsuario.getCveClipro() != null && filtrosUsuario.getCveClipro().length() > 0) {
				CliPro clipro = new CliPro();
				clipro.setCveClipro(filtrosUsuario.getCveClipro());
				q.setParameter("cliente", Arrays.asList(clipro));
			}
			if (filtrosUsuario.getCveCliproNombre() != null && filtrosUsuario.getCveCliproNombre().length() > 0) {
				CliPro clipro = new CliPro();
				clipro.setNombre(filtrosUsuario.getCveCliproNombre());
				q.setParameter("nombre", Arrays.asList(clipro));
			}
			
			if (filtrosUsuario.getEmail() != null && filtrosUsuario.getEmail().length() > 0) {
				q.setParameter("email", Arrays.asList(filtrosUsuario.getEmail()));
			}
*/
			
			if (filtrosUsuario.getContrasena() != null && filtrosUsuario.getContrasena().length() > 0) {
				q.setParameter("contrasena", Arrays.asList(filtrosUsuario.getContrasena()));
			}
			if (filtrosUsuario.getNombre() != null && filtrosUsuario.getNombre().length() > 0) {
				q.setParameter("nombre", Arrays.asList(filtrosUsuario.getNombre()));
			}
			if (filtrosUsuario.getApellidos() != null && filtrosUsuario.getApellidos().length() > 0) {
				q.setParameter("apellidos", Arrays.asList(filtrosUsuario.getApellidos()));
			}
			if (filtrosUsuario.getFechaAlta() != null) {
				q.setParameter("fechaalta", Arrays.asList(filtrosUsuario.getFechaAlta()));
			}
			if (filtrosUsuario.getTipo()!= null && (filtrosUsuario.getTipo() > 0 && filtrosUsuario.getTipo() < 4)) {
				q.setParameter("tipo", Arrays.asList(filtrosUsuario.getTipo()));
			}
			if (filtrosUsuario.getStatus()!= null && (filtrosUsuario.getStatus() > 0 && filtrosUsuario.getStatus() < 3)) {
				q.setParameter("status", Arrays.asList(filtrosUsuario.getStatus()));
			}
			
			queryString.append(" where email = :email;");
//			q.setParameter("email", Arrays.asList(filtrosUsuario.getEmail()));
			q.setParameter("email", Arrays.asList(filtrosUsuario.getEmail()));
			
			q.executeUpdate();
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			e.getStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
}

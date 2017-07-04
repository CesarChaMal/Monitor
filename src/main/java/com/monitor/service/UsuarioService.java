package com.monitor.service;

import java.util.ArrayList;

import javax.persistence.EntityManager;

import com.monitor.dao.UsuarioDao;
import com.monitor.filter.FiltrosUsuario;
import com.monitor.model.dto.UsuarioDTO;
import com.monitor.util.Util;

public class UsuarioService {
	private EntityManager entityManager;
	private UsuarioDao usuarioDao;
	private Util util;
	
	public UsuarioService(EntityManager entityManager) {
		this.entityManager = entityManager;
		usuarioDao = new UsuarioDao(entityManager);
		util = new Util();
	}

	public <T> ArrayList<UsuarioDTO> consultarUsuarios(FiltrosUsuario filtrosUsuario) throws Exception {
		ArrayList<T[]> usuariosList = (ArrayList<T[]>)usuarioDao.consultar(filtrosUsuario);
		ArrayList<UsuarioDTO> usuariosDTOList = util.getUsuariosDTO(usuariosList);		
		return usuariosDTOList;
	}
	
	public void eliminaUsuario(FiltrosUsuario filtrosUsuario) throws Exception {
		usuarioDao.eliminar(filtrosUsuario);
	}
	
	public void actualizaUsuario(FiltrosUsuario filtrosUsuario) throws Exception {
		usuarioDao.actualizar(filtrosUsuario);
	}
}

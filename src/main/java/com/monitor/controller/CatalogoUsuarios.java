package com.monitor.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import com.monitor.filter.PaginacionMonitor;
import com.monitor.model.Usuario;
import com.monitor.persistencia.Persistencia;


@ManagedBean
@SessionScoped
public class CatalogoUsuarios {
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	private Map<Integer, Usuario> usuarios;
	
	private int defaultRegistros = 10;
	private static final int DEFAULT_PAGE_INDEX = 1;
	private int records;
	private int recordsTotal;
	private int pageIndex;
	public Usuario usuario;

    @PostConstruct
	public void init() {
    	traerTodos();
    	usuario = usuarios.get(DEFAULT_PAGE_INDEX);
    	recordsTotal = usuarios.size();
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

    private Map<Integer, Usuario> traerTodos() {
    	Usuario usuario = new Usuario();
    	usuario.consultaTodos();
    	
    	List<Usuario> usuariosList = new ArrayList<>();
    	
    	usuariosList = (ArrayList<Usuario>) persistencia.busqueda(usuario);
    	
//    	usuarios = (HashMap<Integer, Usuario>) persistencia.busqueda(usuario);
    	usuarios = new HashMap<Integer,Usuario>();
    	int cont = 0;
    	for (Usuario user : usuariosList){
    		usuarios.put(++cont,user);
    	}
//    	 usuarios.forEach((k, v) -> System.out.println(k + " => " + v));
    	 
//    	 Map<String, Usuario> map = usuariosList.stream().collect(Collectors.toMap(Usuario::getEmail, item -> item));
//    	 map.forEach((k, v) -> System.out.println(k + " => " + v));
        return usuarios;
    }
    
	public Persistencia getPersistencia() {
		return persistencia;
	}
	
	public void setPersistencia(Persistencia persistencia) {
		this.persistencia = persistencia;
	}

	public CurrentData getCurrentData() {
		return currentData;
	}

	public void setCurrentData(CurrentData currentData) {
		this.currentData = currentData;
	}

}

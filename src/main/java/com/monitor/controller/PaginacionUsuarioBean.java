package com.monitor.controller;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.monitor.filter.FiltrosUsuario;

@ManagedBean
@SessionScoped
public class PaginacionUsuarioBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FiltrosUsuario filtrosUsuario;
	private  String view = "cuadriculaView";;
	@PostConstruct
	public void init() {
		filtrosUsuario = new FiltrosUsuario();
	}
	public FiltrosUsuario getFiltrosUsuario() {
		return filtrosUsuario;
	}
	public void setFiltrosUsuario(FiltrosUsuario filtrosUsuario) {
		this.filtrosUsuario = filtrosUsuario;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	

	
}

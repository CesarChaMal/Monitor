package com.monitor.controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import com.monitor.persistencia.Persistencia;


@ManagedBean
@SessionScoped
public class CatalogoPlaza {
	
	private Integer idUsuario;
	
	private String email;
	
	private String clavePlaza;
	
	private String plaza;
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	public void init()
	{
		
	}
	

	public Integer getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getClavePlaza() {
		return clavePlaza;
	}


	public void setClavePlaza(String clavePlaza) {
		this.clavePlaza = clavePlaza;
	}


	public String getPlaza() {
		return plaza;
	}


	public void setPlaza(String plaza) {
		this.plaza = plaza;
	}
	
	

}

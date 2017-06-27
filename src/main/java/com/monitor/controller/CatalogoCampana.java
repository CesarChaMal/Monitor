package com.monitor.controller;


import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import com.monitor.persistencia.Persistencia;



@ManagedBean
@SessionScoped
public class CatalogoCampana {
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;
	
	
	private Integer idUsuario;
	private String email;
	private String claveCampana;
	private String nombreCampana;
	
	private Date fechaAlta;
	
	private String estatusCampana;
	
	public void init()
	{
		
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

	public String getClaveCampana() {
		return claveCampana;
	}

	public void setClaveCampana(String claveCampana) {
		this.claveCampana = claveCampana;
	}

	public String getNombreCampana() {
		return nombreCampana;
	}

	public void setNombreCampana(String nombreCampana) {
		this.nombreCampana = nombreCampana;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public String getEstatusCampana() {
		return estatusCampana;
	}

	public void setEstatusCampana(String estatusCampana) {
		this.estatusCampana = estatusCampana;
	}

}

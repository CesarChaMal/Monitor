package com.monitor.controller;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import com.monitor.persistencia.Persistencia;


@ManagedBean
@SessionScoped
public class CatalogoUsuarios {
	
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	private String tipoUsuario;
	private String estatusUsuario;
	
	private Integer idUsuario;
	private String email;
	private String nombre;
	private String apellidos;
	
	private String contrasena;
	private Date fechaAlta;

	public void init() {

	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getEstatusUsuario() {
		return estatusUsuario;
	}

	public void setEstatusUsuario(String estatusUsuario) {
		this.estatusUsuario = estatusUsuario;
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	
	
	
	public void traerTodos()
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

}

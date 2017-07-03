package com.monitor.model.dto;

import java.util.Date;

public class CampanaDTO {
	private String cveCampana;
	private String nombre;
	private Date fechaalta;
	private Integer status;
	private CliProDTO clipro;
	
	public CliProDTO getClipro() {
		return clipro;
	}
	public void setClipro(CliProDTO clipro) {
		this.clipro = clipro;
	}
	public String getCveCampana() {
		return cveCampana;
	}
	public void setCveCampana(String cveCampana) {
		this.cveCampana = cveCampana;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Date getFechaalta() {
		return fechaalta;
	}
	public void setFechaalta(Date fechaalta) {
		this.fechaalta = fechaalta;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}

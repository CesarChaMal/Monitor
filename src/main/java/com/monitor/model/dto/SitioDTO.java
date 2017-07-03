package com.monitor.model.dto;

import java.util.Date;

public class SitioDTO {
	private String cveCampana;
	private String cveClipro;
	private String cvePlaza;
	private String cveSitio;
	private Date inicia;
	private Date termina;
	private Integer status;
	private String ubicacion;
	private Integer iluminacion;
	
	public String getCveCampana() {
		return cveCampana;
	}
	public void setCveCampana(String cveCampana) {
		this.cveCampana = cveCampana;
	}
	public String getCveClipro() {
		return cveClipro;
	}
	public void setCveClipro(String cveClipro) {
		this.cveClipro = cveClipro;
	}
	public String getCvePlaza() {
		return cvePlaza;
	}
	public void setCvePlaza(String cvePlaza) {
		this.cvePlaza = cvePlaza;
	}
	public Date getInicia() {
		return inicia;
	}
	public void setInicia(Date inicia) {
		this.inicia = inicia;
	}
	public Date getTermina() {
		return termina;
	}
	public void setTermina(Date termina) {
		this.termina = termina;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIluminacion() {
		return iluminacion;
	}
	public void setIluminacion(Integer iluminacion) {
		this.iluminacion = iluminacion;
	}
	public String getCveSitio() {
		return cveSitio;
	}
	public void setCveSitio(String cveSitio) {
		this.cveSitio = cveSitio;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
}

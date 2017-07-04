package com.monitor.model.dto;

public class SitioDTO {
	private String cveSitio;
	private String cveCampana;
	private String cvePlaza;
	private String cveClipro;
	private String ubicacion;
	private Integer iluminacion;
	private Integer status;
	private CliProDTO clipro;
	private CampanaDTO campana;
	private PlazaDTO plaza;
	
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
	public CliProDTO getClipro() {
		return clipro;
	}
	public void setClipro(CliProDTO clipro) {
		this.clipro = clipro;
	}
	public CampanaDTO getCampana() {
		return campana;
	}
	public void setCampana(CampanaDTO campana) {
		this.campana = campana;
	}
	public PlazaDTO getPlaza() {
		return plaza;
	}
	public void setPlaza(PlazaDTO plaza) {
		this.plaza = plaza;
	}
}

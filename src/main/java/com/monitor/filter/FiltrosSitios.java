package com.monitor.filter;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.primefaces.model.TreeNode;

@ManagedBean(name="filtrosSitios")
@SessionScoped
public class FiltrosSitios extends Filtros {

	private String cveSitio;
	private String ubicacion;
	private Integer iluminacion;
	private Integer status;
	private String cveClipro;
	private String cveCampana;
	private String cvePlaza;
	private Integer orden; 
	
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
	public Integer getIluminacion() {
		return iluminacion;
	}
	public void setIluminacion(Integer iluminacion) {
		this.iluminacion = iluminacion;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCveClipro() {
		return cveClipro;
	}
	public void setCveClipro(String cveClipro) {
		this.cveClipro = cveClipro;
	}
	public String getCveCampana() {
		return cveCampana;
	}
	public void setCveCampana(String cveCampana) {
		this.cveCampana = cveCampana;
	}
	public String getCvePlaza() {
		return cvePlaza;
	}
	public void setCvePlaza(String cvePlaza) {
		this.cvePlaza = cvePlaza;
	}
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
}

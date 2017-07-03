package com.monitor.filter;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.monitor.util.Util;


@ManagedBean(name="filtrosCampana")
@SessionScoped
public class FiltrosCampana extends Filtros {

	private String cve_campana;
	private String nombre;
	private Date fechaAlta;
	private Integer status;
	private String cveClipro;
	private String cveCliproNombre;
	
	private Util util= new Util();

	public String getCve_campana() {
		return cve_campana;
	}
	public void setCve_campana(String cve_campana) {
		this.cve_campana = cve_campana;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getFechaAlta() throws Exception {
		return util.formatDate(fechaAlta);
	}
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}
	public String getCveClipro() {
		return cveClipro;
	}
	public void setCveClipro(String cveClipro) {
		this.cveClipro = cveClipro;
	}
	public String getCveCliproNombre() {
		return cveCliproNombre;
	}
	public void setCveCliproNombre(String cveCliproNombre) {
		this.cveCliproNombre = cveCliproNombre;
	}
	public Util getUtil() {
		return util;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
}

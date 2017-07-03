package com.monitor.filter;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.monitor.util.Util;


@ManagedBean(name="filtrosCampana")
@SessionScoped
public class FiltrosCampana {

	private String cve_campana;
	
	private String cve_cliente_cam;
	
	private String nombre;
	
	private Integer status;
	
	
	private Util util= new Util();


	public String getCve_campana() {
		return cve_campana;
	}


	public void setCve_campana(String cve_campana) {
		this.cve_campana = cve_campana;
	}


	public String getCve_cliente_cam() {
		return cve_cliente_cam;
	}


	public void setCve_cliente_cam(String cve_cliente_cam) {
		this.cve_cliente_cam = cve_cliente_cam;
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


	public Util getUtil() {
		return util;
	}


	public void setUtil(Util util) {
		this.util = util;
	}
	
}

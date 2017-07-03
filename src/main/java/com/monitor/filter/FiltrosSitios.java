package com.monitor.filter;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.primefaces.model.TreeNode;

@ManagedBean(name="filtrosSitios")
@SessionScoped
public class FiltrosSitios {
	
	
	private String email;
	
	
	private TreeNode root;
	
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public TreeNode getRoot() {
		return root;
	}

	public void setRoot(TreeNode root) {
		this.root = root;
	}

	public String getCodigoSitio() {
		return codigoSitio;
	}

	public void setCodigoSitio(String codigoSitio) {
		this.codigoSitio = codigoSitio;
	}

	public String getPlaza() {
		return plaza;
	}

	public void setPlaza(String plaza) {
		this.plaza = plaza;
	}

	public String getCampana() {
		return campana;
	}

	public void setCampana(String campana) {
		this.campana = campana;
	}

	public String getOrdenarPlazaCampana() {
		return ordenarPlazaCampana;
	}

	public void setOrdenarPlazaCampana(String ordenarPlazaCampana) {
		this.ordenarPlazaCampana = ordenarPlazaCampana;
	}

	public String getIluminacion() {
		return iluminacion;
	}

	public void setIluminacion(String iluminacion) {
		this.iluminacion = iluminacion;
	}

	public String getEstatusSitio() {
		return estatusSitio;
	}

	public void setEstatusSitio(String estatusSitio) {
		this.estatusSitio = estatusSitio;
	}

	private String codigoSitio;
	
	private String plaza;
	
	private String campana;
	
	private String ordenarPlazaCampana;
	
	private String iluminacion;
	
	private String estatusSitio;
	
	

}

package com.monitor.controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;

import com.monitor.persistencia.Persistencia;

 

@ManagedBean
@SessionScoped
public class CatalogoSitios {
	
	private Integer idUsuario;
	private String email;
	
	
	private TreeNode root;
	
	
	private String codigoSitio;
	
	private String plaza;
	
	private String campana;
	
	private String ordenarPlazaCampana;
	
	private String iluminacion;
	
	private String estatusSitio;
	
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	public void init()
	{
		 root = new DefaultTreeNode("Root", null);
	        TreeNode node0 = new DefaultTreeNode("Node 0", root);
	        TreeNode node1 = new DefaultTreeNode("Node 1", root);
	         
	        TreeNode node00 = new DefaultTreeNode("Node 0.0", node0);
	        TreeNode node01 = new DefaultTreeNode("Node 0.1", node0);
	         
	        TreeNode node10 = new DefaultTreeNode("Node 1.0", node1);
	         
	        node1.getChildren().add(new DefaultTreeNode("Node 1.1"));
	        node00.getChildren().add(new DefaultTreeNode("Node 0.0.0"));
	        node00.getChildren().add(new DefaultTreeNode("Node 0.0.1"));
	        node01.getChildren().add(new DefaultTreeNode("Node 0.1.0"));
	        node10.getChildren().add(new DefaultTreeNode("Node 1.0.0"));
	        root.getChildren().add(new DefaultTreeNode("Node 2"));
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


}

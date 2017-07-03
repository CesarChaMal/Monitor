package com.monitor.filter;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.primefaces.model.TreeNode;

@ManagedBean(name="filtrosSitios")
@SessionScoped
public class FiltrosSitios extends Filtros {

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
}

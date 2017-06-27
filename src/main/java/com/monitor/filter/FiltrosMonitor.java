package com.monitor.filter;

public class FiltrosMonitor {

	private String ordenarPor = "0";
	private String[] filterPlaza;
	private String[] filterCampana;
	private String[] filterSitio;
	private String emailUser;

	public String getOrdenarPor() {
		System.out.println("getOrdenarPor " + ordenarPor);
		return ordenarPor;
	}

	public void setOrdenarPor(String ordenarPor) {
		System.out.println("setOrdenarPor " + ordenarPor);
		this.ordenarPor = ordenarPor;
	}

	public String[] getFilterPlaza() {
		return filterPlaza;
	}

	public void setFilterPlaza(String[] filterPlaza) {
		this.filterPlaza = filterPlaza;
	}

	public String[] getFilterCampana() {
		return filterCampana;
	}

	public void setFilterCampana(String[] filterCampana) {
		this.filterCampana = filterCampana;
	}

	public String[] getFilterSitio() {
		return filterSitio;
	}

	public void setFilterSitio(String[] filterSitio) {
		this.filterSitio = filterSitio;
	}

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}

}
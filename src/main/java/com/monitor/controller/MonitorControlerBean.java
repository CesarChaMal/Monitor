package com.monitor.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import com.monitor.filter.FiltrosMonitor;
import com.monitor.filter.PaginacionMonitor;
import com.monitor.model.Campana;
import com.monitor.model.Foto;
import com.monitor.model.Plaza;
import com.monitor.model.Sitio;
import com.monitor.persistencia.Persistencia;

@ManagedBean
@ViewScoped
public class MonitorControlerBean {
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	@ManagedProperty("#{userManager.email}")
	public String emailUserLogIn;	
	private String view = "cuadriculaView";
	private PaginacionMonitor paginacionMonitor;
	private ArrayList<Plaza> plazaList;
	private ArrayList<Campana> campanaList;
	private ArrayList<Sitio> sitioList;
	private FiltrosMonitor filtrosMonitor;
	private ArrayList<Foto> fotolistMostrar;
	private Foto foto;

	@PostConstruct
	public void init() {		
		filtrosMonitor = new FiltrosMonitor();
		filtrosMonitor.setEmailUser(emailUserLogIn);
		foto = new Foto();
		
		
		Plaza plaza = new Plaza();
		plaza.consultaPlazasActivas();
		plazaList = (ArrayList<Plaza>)persistencia.busqueda(plaza);

		Campana campana = new Campana();
		campana.consultaCampanasActivas();
		campanaList = (ArrayList<Campana>)persistencia.busqueda(campana);
		
		Sitio sitio = new Sitio();
		sitio.consultaSitiosActivos();
		sitioList = (ArrayList<Sitio>)persistencia.busqueda(sitio);		
		getFotosToShow();
	
		
	}

	public PaginacionMonitor getPaginacionMonitor() {
		return paginacionMonitor;
	}

	public void setPaginacionMonitor(PaginacionMonitor paginacionMonitor) {
		this.paginacionMonitor = paginacionMonitor;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public void irPagina() {
		if (paginacionMonitor.getPageIndex() < 1
				|| paginacionMonitor.getPageIndex() > paginacionMonitor
						.getPages()) {
			FacesMessage infoMsg = new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Página no encontrada",
					"La página introducida no es correcta.");
			FacesContext.getCurrentInstance().addMessage("messages", infoMsg);

		} else {
			paginacionMonitor.updateIrPagina();
		}

	}

	public void getFotosToShow(){		
		foto.obtenerFotosPorUsuario(filtrosMonitor);		
		fotolistMostrar=(ArrayList<Foto>)persistencia.busqueda(foto);
		paginacionMonitor = new PaginacionMonitor();		
		paginacionMonitor.setModel(fotolistMostrar);
		
	}
	public ArrayList<Plaza> getPlazaList() {
		return plazaList;
	}

	public void setPlazaList(ArrayList<Plaza> plazaList) {
		this.plazaList = plazaList;
	}

	public ArrayList<Campana> getCampanaList() {
		return campanaList;
	}

	public void setCampanaList(ArrayList<Campana> campanaList) {
		this.campanaList = campanaList;
	}

	public ArrayList<Sitio> getSitioList() {
		return sitioList;
	}

	public void setSitioList(ArrayList<Sitio> sitioList) {
		this.sitioList = sitioList;
	}

	public FiltrosMonitor getFiltrosMonitor() {
		return filtrosMonitor;
	}

	public void setFiltrosMonitor(FiltrosMonitor filtrosMonitor) {
		this.filtrosMonitor = filtrosMonitor;
	}

	public Persistencia getPersistencia() {
		return persistencia;
	}

	public void setPersistencia(Persistencia persistencia) {
		this.persistencia = persistencia;
	}

	public String getEmailUserLogIn() {
		return emailUserLogIn;
	}

	public void setEmailUserLogIn(String emailUserLogIn) {
		this.emailUserLogIn = emailUserLogIn;
	}
}
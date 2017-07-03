package com.monitor.controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.FiltrosSitios;
import com.monitor.filter.Paginacion;
import com.monitor.model.dto.SitioDTO;
import com.monitor.persistencia.Persistencia;
import com.monitor.service.SitioService;
import com.monitor.util.Navigation;
import com.monitor.util.Util;

 

@ManagedBean
@SessionScoped
public class CatalogoSitios implements Navigation {
	
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
	
	@ManagedProperty("#{filtroSitios}")
	private FiltrosSitios filtroSitios;
	
	private SitioDTO sitioDTO; 
	
	private List<SitioDTO> sitioDTOList;
	
	private Paginacion  paginacion;
	
	private SitioService sitioService;
	
	
	private HttpServletRequest request;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogoSitios.class);

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
	        
	        
	     try
	     {
	        
	        sitioService = new SitioService(persistencia.getEntityManager());
	        
	        sitioDTOList= sitioService.consultaSitiosActivos("nosecomo llegue el clipro");
	        
	        paginacion = new Paginacion();
	        
	        paginacion.setModel(sitioDTOList);
			paginacion.setPageIndex(0);
			if (sitioDTOList.size() > 0)
				sitioDTO = sitioDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
	        
	        
	}

	
	public void next() {
		paginacion.next();
		sitioDTO = sitioDTOList.get(paginacion.getPageIndex());
	}
	
	public void prev() {
		paginacion.prev();
		sitioDTO = sitioDTOList.get(paginacion.getPageIndex());
	}
	
	
	
	public void busqueda() {
	    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String txtCliente = request.getParameter("formCatalogo:txtCliente");
        LOGGER.debug("txtCliente: " + txtCliente);
        filtroSitios.setEmail(txtCliente);
		update();
	}
	
	public void update() {
		try {
			sitioDTO = null;
			sitioDTOList = sitioService.consultaSitiosActivos("");
			paginacion.setModel(sitioDTOList);
			paginacion.setPageIndex(0);
			if (sitioDTOList.size() > 0)
				sitioDTO = sitioDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
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


	@Override
	public void irA() {
	  String irA = request.getParameter("formCatalogo:irA");
	  if (Util.isParsable(irA)) {
		  paginacion.setPageIndex(Integer.parseInt(irA)-1);
		  update();
	  }
	}


	@Override
	public void eliminar() {
		try {
			String txtEmail = request.getParameter("formCatalogo:txtEmail");
			
			LOGGER.debug("txtEmail: " + txtEmail);
			filtroSitios.setEmail(txtEmail);
			sitioService.eliminaUsuario(filtroSitios);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}


	@Override
	public void actualizar() {
	}


	public FiltrosSitios getFiltroSitios() {
		return filtroSitios;
	}


	public void setFiltroSitios(FiltrosSitios filtroSitios) {
		this.filtroSitios = filtroSitios;
	}


	public SitioDTO getSitioDTO() {
		return sitioDTO;
	}


	public void setSitioDTO(SitioDTO sitioDTO) {
		this.sitioDTO = sitioDTO;
	}


	public List<SitioDTO> getSitioDTOList() {
		return sitioDTOList;
	}


	public void setSitioDTOList(List<SitioDTO> sitioDTOList) {
		this.sitioDTOList = sitioDTOList;
	}


	public Paginacion getPaginacion() {
		return paginacion;
	}


	public void setPaginacion(Paginacion paginacion) {
		this.paginacion = paginacion;
	}





}

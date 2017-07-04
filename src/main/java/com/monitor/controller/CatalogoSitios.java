package com.monitor.controller;

import java.util.List;

import javax.annotation.PostConstruct;
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
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	@ManagedProperty("#{filtrosSitios}")
	private FiltrosSitios filtrosSitios;

	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogoSitios.class);
	public SitioDTO sitio;
	private List<SitioDTO> sitiosDTOList;
	private Paginacion paginacion;
	private SitioService sitioService;
	private HttpServletRequest request;
	private Integer orden;

	private TreeNode root;
	
    @PostConstruct
	public void init() {
		try {
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			sitioService = new SitioService(persistencia.getEntityManager());
			sitiosDTOList = sitioService.consultarSitios(filtrosSitios);
			paginacion = new Paginacion();
			paginacion.setModel(sitiosDTOList);
			paginacion.setPageIndex(0);
			orden = 1;
			if (sitiosDTOList.size() > 0)
				sitio = sitiosDTOList.get(paginacion.getPageIndex());
			
//			root = new DefaultTreeNode("Root", null);
//			TreeNode node0 = new DefaultTreeNode("Node 0", root);
//			TreeNode node1 = new DefaultTreeNode("Node 1", root);
//			
//			TreeNode node00 = new DefaultTreeNode("Node 0.0", node0);
//			TreeNode node01 = new DefaultTreeNode("Node 0.1", node0);
//			
//			TreeNode node10 = new DefaultTreeNode("Node 1.0", node1);
//			
//			node1.getChildren().add(new DefaultTreeNode("Node 1.1"));
//			node00.getChildren().add(new DefaultTreeNode("Node 0.0.0"));
//			node00.getChildren().add(new DefaultTreeNode("Node 0.0.1"));
//			node01.getChildren().add(new DefaultTreeNode("Node 0.1.0"));
//			node10.getChildren().add(new DefaultTreeNode("Node 1.0.0"));
//			root.getChildren().add(new DefaultTreeNode("Node 2"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Paginacion getPaginacion() {
		return paginacion;
	}

	public void setPaginacion(Paginacion paginacion) {
		this.paginacion = paginacion;
	}

	public SitioDTO getSitio() {
		return sitio;
	}

	public void setSitioDTO(SitioDTO sitio) {
		this.sitio = sitio;
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

	public FiltrosSitios getFiltrosSitios() {
		return filtrosSitios;
	}

	public void setFiltroSitios(FiltrosSitios filtrosSitios) {
		this.filtrosSitios = filtrosSitios;
	}

	public void next() {
		paginacion.next();
		sitio = sitiosDTOList.get(paginacion.getPageIndex());
	}
	
	public void prev() {
		paginacion.prev();
		sitio = sitiosDTOList.get(paginacion.getPageIndex());
	}
	
	@Override
	public void irA() {
	  String irA = request.getParameter("formCatalogo:irA");
	  if (Util.isParsable(irA)) {
		  paginacion.setPageIndex(Integer.parseInt(irA)-1);
		  update();
	  }
	}

	public void busqueda() {
	    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String txtCliente = request.getParameter("formCatalogo:txtCliente");
        LOGGER.debug("txtCliente: " + txtCliente);
        filtrosSitios.setCveClipro(txtCliente);
		update();
	}
	
	public void busquedaTree() {
		request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		String txtCliente = request.getParameter("formCatalogo:txtCliente");
		String rbnOrdenar = request.getParameter("formCatalogo:rbnOrdenar");
		LOGGER.debug("txtCliente: " + txtCliente);
		LOGGER.debug("rbnOrdenar: " + rbnOrdenar);
		filtrosSitios.setCveClipro(txtCliente);
		filtrosSitios.setOrden(Integer.parseInt(rbnOrdenar));
		orden = filtrosSitios.getOrden(); 
		updateTree();
	}
	
	public void update() {
		try {
			sitio = null;
			sitiosDTOList = sitioService.consultarSitios(filtrosSitios);
			paginacion.setModel(sitiosDTOList);
			if (sitiosDTOList.size() > 0)
				sitio = sitiosDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateTree() {
		try {
			sitiosDTOList = sitioService.consultarTreeSitios(filtrosSitios);
//			root = 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void eliminar() {
		try {
			String txtCveSitio = request.getParameter("formCatalogo:txtCveSitio");
			LOGGER.debug("txtCveSitio: " + txtCveSitio);
			
			filtrosSitios.setCveSitio(txtCveSitio);
			sitioService.eliminaSitio(filtrosSitios);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	public void actualizar() {
		try {
	        String txtCliente = request.getParameter("formCatalogo:txtCliente");
	        String txtClienteNombre = request.getParameter("formCatalogo:txtClienteNombre");
	        String txtCveSitio = request.getParameter("formCatalogo:txtCveSitio");
			String cboCampana = request.getParameter("formCatalogo:cboCampana");
			String cboPlaza = request.getParameter("formCatalogo:cboPlaza");
			String txtUbicacion = request.getParameter("formCatalogo:txtUbicacion");
			String rbnIluminacion = request.getParameter("formCatalogo:rbnIluminacion");
			String rbnEstatus = request.getParameter("formCatalogo:statusCampana");

			filtrosSitios.setCveClipro(txtCliente);
			filtrosSitios.setCveSitio(txtCveSitio);
			filtrosSitios.setCveCampana(cboCampana);
			filtrosSitios.setCvePlaza(cboPlaza);
			filtrosSitios.setUbicacion(txtUbicacion);
	        if (Util.isParsable(rbnIluminacion)) {
				filtrosSitios.setStatus(Integer.parseInt(rbnIluminacion));
	        }
	        if (Util.isParsable(rbnEstatus)) {
	        	filtrosSitios.setStatus(Integer.parseInt(rbnEstatus));
	        }
			
			sitioService.actualizaSitio(filtrosSitios);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public TreeNode getRoot() {
		return root;
	}

	public void setRoot(TreeNode root) {
		this.root = root;
	}

	public Integer getOrden() {
		return orden;
	}

	public void setOrden(Integer orden) {
		this.orden = orden;
	}

}

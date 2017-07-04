package com.monitor.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.flow.FlowScoped;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.FiltrosCampana;
import com.monitor.filter.FiltrosUsuario;
import com.monitor.filter.Paginacion;
import com.monitor.model.dto.CampanaDTO;
import com.monitor.model.dto.UsuarioDTO;
import com.monitor.persistencia.Persistencia;
import com.monitor.service.CampanaService;
import com.monitor.service.UsuarioService;
import com.monitor.util.Navigation;
import com.monitor.util.Util;


@ManagedBean
//@ViewScoped
@SessionScoped
public class CatalogoCampana implements Navigation {
	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogoCampana.class);
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	@ManagedProperty("#{filtrosCampana}")
	public FiltrosCampana filtrosCampana;

	public Paginacion paginacion;
	private CampanaDTO campana;
	private List<CampanaDTO> campanasDTOList;
	private CampanaService campanaService;
	private HttpServletRequest request;

    @PostConstruct
	public void init() {
		try {
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			campanaService = new CampanaService(persistencia.getEntityManager());
			campanasDTOList = campanaService.consultarCampanas(filtrosCampana);
			paginacion = new Paginacion();
			paginacion.setModel(campanasDTOList);
			paginacion.setPageIndex(0);
			if (campanasDTOList.size() > 0)
				campana = campanasDTOList.get(paginacion.getPageIndex());
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

	public CampanaDTO getCampana() {
		return campana;
	}

	public void setCampana(CampanaDTO campana) {
		this.campana = campana;
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

	public FiltrosCampana getFiltrosCampana() {
		return filtrosCampana;
	}

	public void setFiltrosCampana(FiltrosCampana filtrosCampana) {
		this.filtrosCampana = filtrosCampana;
	}

	public void next() {
		paginacion.next();
		campana = campanasDTOList.get(paginacion.getPageIndex());
	}
	
	public void prev() {
		paginacion.prev();
		campana = campanasDTOList.get(paginacion.getPageIndex());
	}

	public void irA() {
	    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String irA = request.getParameter("formCatalogo:irA");
        if (Util.isParsable(irA)) {
        	paginacion.setPageIndex(Integer.parseInt(irA)-1);
        	update();
        }
//    	paginacion.setPageIndex(paginacion.getIrA()-1);
//    	update();
	}
	
	public void busqueda() {
		filtrosCampana = new FiltrosCampana();
	    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		String txtCliente = request.getParameter("formCatalogo:txtCliente");
		String txtCveCampana = request.getParameter("formCatalogo:txtCveCampana");
		LOGGER.debug("txtCliente: " + txtCliente);
		LOGGER.debug("txtCveCampana: " + txtCveCampana);
		filtrosCampana.setCveClipro(txtCliente);
		filtrosCampana.setCveCampana(txtCveCampana);
//		filtrosCampana.setCveClipro(campana.getClipro().getCveClipro());
		update();
	}
	
	public void update() {
		try {
			filtrosCampana = new FiltrosCampana();
			campana = null;
//			campana = new CampanaDTO();
			campanasDTOList = campanaService.consultarCampanas(filtrosCampana);
			paginacion.setModel(campanasDTOList);
			if (campanasDTOList.size() > 0)
				campana = campanasDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar() {
		try {
			filtrosCampana = new FiltrosCampana();
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			String txtCveCampana = request.getParameter("formCatalogo:txtCveCampana");
			LOGGER.debug("txtCveCampana: " + txtCveCampana);
			filtrosCampana.setCveCampana(txtCveCampana);
			campanaService.eliminaCampana(filtrosCampana);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void actualizar() {
		try {
			filtrosCampana = new FiltrosCampana();
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yy");
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
	        String txtCliente = request.getParameter("formCatalogo:txtCliente");
	        String txtClienteNombre = request.getParameter("formCatalogo:txtClienteNombre");
			String txtCveCampana = request.getParameter("formCatalogo:txtCveCampana");
			String txtNombre = request.getParameter("formCatalogo:txtNombre");
			String txtFechaAlta = request.getParameter("formCatalogo:txtFechaAlta_input");
			String statusCampana = request.getParameter("formCatalogo:statusCampana");

			filtrosCampana.setCveCampana(txtCveCampana);
			filtrosCampana.setNombre(txtNombre);
			if (txtFechaAlta != null){
				filtrosCampana.setFechaAlta(formatter.parse(txtFechaAlta));
			}
	        if (Util.isParsable(statusCampana)) {
				filtrosCampana.setStatus(Integer.parseInt(statusCampana));
	        }
			
//			filtrosCampana.setCve_campana(campana.getCveCampana());
//			filtrosCampana.setNombre(campana.getNombre());
//			filtrosCampana.setFechaAlta(campana.getFechaalta());
//			filtrosCampana.setStatus(campana.getStatus());
			
			campanaService.actualizaCampana(filtrosCampana);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

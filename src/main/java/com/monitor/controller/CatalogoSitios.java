package com.monitor.controller;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.Filtros;
import com.monitor.filter.FiltrosSitios;
import com.monitor.filter.Paginacion;
import com.monitor.model.dto.CampanaDTO;
import com.monitor.model.dto.PlazaDTO;
import com.monitor.model.dto.SitioDTO;
import com.monitor.persistencia.Persistencia;
import com.monitor.service.CampanaService;
import com.monitor.service.PlazaService;
import com.monitor.service.SitioService;
import com.monitor.util.Navigation;
import com.monitor.util.Util;

@ManagedBean
@ViewScoped
public class CatalogoSitios implements Navigation, Serializable {
	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogoSitios.class);
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	private FiltrosSitios filtrosSitios;
	private Paginacion paginacion;
	private SitioDTO sitio;
	private List<SitioDTO> sitiosDTOList;
	private List<SitioDTO> sitiosTreeDTOList;
	private List<PlazaDTO> plazaDTOList;
	private List<CampanaDTO> campanaDTOList;
	private SitioService sitioService;
	private HttpServletRequest request;
	private Integer orden;
	private TreeNode root;
	private CampanaService campanaService;
	private PlazaService plazaService;

    @PostConstruct
	public void init() {
		try {
			filtrosSitios = new FiltrosSitios();
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			sitioService = new SitioService(persistencia.getEntityManager());
			campanaService = new CampanaService(persistencia.getEntityManager());
			plazaService = new PlazaService(persistencia.getEntityManager());

			sitiosDTOList = sitioService.consultarSitios(filtrosSitios);
			plazaDTOList = plazaService.consultaPlazas();
			campanaDTOList = campanaService.consultaCampanas();
			
			paginacion = new Paginacion();
			paginacion.setModel(sitiosDTOList);
			paginacion.setPageIndex(0);
//			orden = 1;
			if (sitiosDTOList.size() > 0)
				sitio = sitiosDTOList.get(paginacion.getPageIndex());
			busquedaTree();
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
		update(filtrosSitios);
		paginacion.next();
		sitio = sitiosDTOList.get(paginacion.getPageIndex());
	}
	
	public void prev() {
		update(filtrosSitios);
		paginacion.prev();
		sitio = sitiosDTOList.get(paginacion.getPageIndex());
	}
	
	@Override
	public void irA() {
		request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		String irA = request.getParameter("formCatalogo:irA");
		if (Util.isParsable(irA)) {
			paginacion.setPageIndex(Integer.parseInt(irA)-1);
			update(filtrosSitios);
		}
	}

	public void busqueda() {
		filtrosSitios = new FiltrosSitios();
	    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String txtCliente = request.getParameter("formCatalogo:txtCliente");
        LOGGER.debug("txtCliente: " + txtCliente);
        filtrosSitios.setCveClipro(txtCliente);
		update(filtrosSitios);
	}
	
	public void busquedaTree() {
		filtrosSitios = new FiltrosSitios();
		request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
//		String txtCliente = request.getParameter("formCatalogo:txtCliente");
		String txtCliente = currentData.getUsuario().getCliPro().getCveClipro();
		String rbnOrdenar = request.getParameter("formCatalogo:rbnOrdenar");
		LOGGER.debug("txtCliente: " + txtCliente);
		LOGGER.debug("rbnOrdenar: " + rbnOrdenar);
		
//		filtrosSitios.setCveClipro(txtCliente);
        if (Util.isParsable(rbnOrdenar)) {
        	filtrosSitios.setOrden(Integer.parseInt(rbnOrdenar));
        } else {
        	filtrosSitios.setOrden(1);
        }
		orden = filtrosSitios.getOrden(); 
		updateTree(filtrosSitios);
	}
	
	public void update(Filtros filtrosSitios) {
		try {
			sitio = null;
			sitiosDTOList = sitioService.consultarSitios((FiltrosSitios) filtrosSitios);
			paginacion.setModel(sitiosDTOList);
			if (sitiosDTOList.size() > 0)
				sitio = sitiosDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateTree(Filtros filtrosSitios) {
		try {
			sitiosTreeDTOList = sitioService.consultarTreeSitios((FiltrosSitios) filtrosSitios);
			
			if ( ((FiltrosSitios) filtrosSitios).getOrden() != null && ( ((FiltrosSitios) filtrosSitios).getOrden() >= 0) && ((FiltrosSitios) filtrosSitios).getOrden() <= 2 )  {
				Integer order = ((FiltrosSitios) filtrosSitios).getOrden();
				
				switch (order) {
				case 1:
					root = new DefaultTreeNode("Plaza", null);
					break;
				case 2:
					root = new DefaultTreeNode("Campaña", null);
					break;
				default:
					root = new DefaultTreeNode("Plaza", null);
					break;
				}
			}

			for (SitioDTO sitioDTO : sitiosDTOList) {
				if ( ((FiltrosSitios) filtrosSitios).getOrden() != null && ( ((FiltrosSitios) filtrosSitios).getOrden() >= 0) && ((FiltrosSitios) filtrosSitios).getOrden() <= 2 )  {
					Integer order = ((FiltrosSitios) filtrosSitios).getOrden();
					
					TreeNode node0 = null;
					TreeNode node00 = null;
					switch (order) {
					case 1:
						node0 = new DefaultTreeNode(sitioDTO.getPlaza().getNombre(), root);
						node00 = new DefaultTreeNode(sitioDTO.getCampana().getNombre(), node0);
						break;
					case 2:
						node0 = new DefaultTreeNode(sitioDTO.getCampana().getNombre(), root);
						node00 = new DefaultTreeNode(sitioDTO.getPlaza().getNombre(), node0);
						break;
					default:
						node0 = new DefaultTreeNode(sitioDTO.getPlaza().getNombre(), root);
						node00 = new DefaultTreeNode(sitioDTO.getCampana().getNombre(), node0);
						break;
					}
					node00.getChildren().add(new DefaultTreeNode(sitio.getCveSitio()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void eliminar() {
		try {
			filtrosSitios = new FiltrosSitios();
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			String txtCveSitio = request.getParameter("formCatalogo:txtCveSitio");
			LOGGER.debug("txtCveSitio: " + txtCveSitio);
			
			filtrosSitios.setCveSitio(txtCveSitio);
			sitioService.eliminaSitio(filtrosSitios);
			update(filtrosSitios);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	public void actualizar() {
		try {
			filtrosSitios = new FiltrosSitios();
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
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
			update(filtrosSitios);
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

	public List<PlazaDTO> getPlazaDTOList() {
		return plazaDTOList;
	}

	public void setPlazaDTOList(List<PlazaDTO> plazaDTOList) {
		this.plazaDTOList = plazaDTOList;
	}

	public List<CampanaDTO> getCampanaDTOList() {
		return campanaDTOList;
	}

	public void setCampanaDTOList(List<CampanaDTO> campanaDTOList) {
		this.campanaDTOList = campanaDTOList;
	}

}

package com.monitor.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.filter.FiltrosUsuario;
import com.monitor.filter.Paginacion;
import com.monitor.model.dto.UsuarioDTO;
import com.monitor.persistencia.Persistencia;
import com.monitor.service.UsuarioService;
import com.monitor.util.Navigation;
import com.monitor.util.Util;


@ManagedBean
@ViewScoped
public class CatalogoUsuarios implements Navigation {
	
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;
	
	@ManagedProperty("#{currentData}")
	public CurrentData currentData;

	@ManagedProperty("#{filtrosUsuario}")
	private FiltrosUsuario filtrosUsuario;

	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogoUsuarios.class);
	public UsuarioDTO usuario;
	private List<UsuarioDTO> usuariosDTOList;
	private Paginacion paginacion;
	private UsuarioService usuarioService;
	private HttpServletRequest request;

    @PostConstruct
	public void init() {
		try {
		    request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			usuarioService = new UsuarioService(persistencia.getEntityManager());
			usuariosDTOList = usuarioService.consultarUsuarios(filtrosUsuario);
			paginacion = new Paginacion();
			paginacion.setModel(usuariosDTOList);
			paginacion.setPageIndex(0);
			if (usuariosDTOList.size() > 0)
				usuario = usuariosDTOList.get(paginacion.getPageIndex());
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

	public UsuarioDTO getUsuario() {
		return usuario;
	}

	public void setUsuario(UsuarioDTO usuario) {
		this.usuario = usuario;
	}

/*
	private List<Usuario> traerTodos() {
    	Usuario usuario = new Usuario();
    	usuario.consultaTodos();
    	
    	List<Usuario> usuariosList = new ArrayList<>();
    	usuariosList = (ArrayList<Usuario>) persistencia.busqueda(usuario);
        return usuarios;
    }
    
*/	
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

	public FiltrosUsuario getFiltrosUsuario() {
		return filtrosUsuario;
	}

	public void setFiltrosUsuario(FiltrosUsuario filtrosUsuario) {
		this.filtrosUsuario = filtrosUsuario;
	}

	public void next() {
		paginacion.next();
		usuario = usuariosDTOList.get(paginacion.getPageIndex());
	}
	
	public void prev() {
		paginacion.prev();
		usuario = usuariosDTOList.get(paginacion.getPageIndex());
	}

	public void irA() {
//        String irA = request.getParameter("formCatalogo:irA");
//        if (Util.isParsable(irA)) {
//        	paginacion.setPageIndex(Integer.parseInt(irA)-1);
//        	update();
//        }
    	paginacion.setPageIndex(paginacion.getIrA()-1);
    	update();
	}
	
	public void busqueda() {
//		String txtCliente = request.getParameter("formCatalogo:txtCliente");
//		LOGGER.debug("txtCliente: " + txtCliente);
//		filtrosUsuario.setCveClipro(txtCliente);
		filtrosUsuario.setCveClipro(usuario.getClipro().getCveClipro());
		update();
	}
	
	public void update() {
		try {
			usuario = null;
			usuariosDTOList = usuarioService.consultarUsuarios(filtrosUsuario);
			paginacion.setModel(usuariosDTOList);
			if (usuariosDTOList.size() > 0)
				usuario = usuariosDTOList.get(paginacion.getPageIndex());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar() {
		try {
//			String txtEmail = request.getParameter("formCatalogo:txtEmail");
			
//			LOGGER.debug("txtEmail: " + txtEmail);
//			filtrosUsuario.setEmail(txtEmail);
			filtrosUsuario.setEmail(usuario.getEmail());
			usuarioService.eliminaUsuario(filtrosUsuario);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void actualizar() {
		try {
//			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yy");
			
//	        String txtCliente = request.getParameter("formCatalogo:txtCliente");
//	        String txtClienteNombre = request.getParameter("formCatalogo:txtClienteNombre");
//			String txtEmail = request.getParameter("formCatalogo:txtEmail");
//			String txtContrasena = request.getParameter("formCatalogo:txtContrasena");
//			String txtNombre = request.getParameter("formCatalogo:txtNombre");
//			String txtApellidos = request.getParameter("formCatalogo:txtApellidos");
//			String txtFechaAlta = request.getParameter("formCatalogo:txtFechaAlta_input");
//			String tipoUsuario = request.getParameter("formCatalogo:tipoUsuario");
//			String statusUsuario = request.getParameter("formCatalogo:statusUsuario");

//			filtrosUsuario.setCveClipro(txtCliente);
//			filtrosUsuario.setCveCliproNombre(txtClienteNombre);
//			filtrosUsuario.setEmail(txtEmail);
//			filtrosUsuario.setContrasena(txtContrasena);
//			filtrosUsuario.setNombre(txtNombre);
//			filtrosUsuario.setApellidos(txtApellidos);
//			filtrosUsuario.setFechaAlta(formatter.parse(txtFechaAlta));
//			filtrosUsuario.setTipo(Integer.parseInt(tipoUsuario));
//			filtrosUsuario.setStatus(Integer.parseInt(statusUsuario));
			
			filtrosUsuario.setCveClipro(usuario.getClipro().getCveClipro());
			filtrosUsuario.setCveCliproNombre(usuario.getClipro().getCveClipro());
			filtrosUsuario.setEmail(usuario.getEmail());
			filtrosUsuario.setContrasena(usuario.getContrasena());
			filtrosUsuario.setNombre(usuario.getNombre());
			filtrosUsuario.setApellidos(usuario.getApellidos());
			filtrosUsuario.setFechaAlta(usuario.getFechaalta());
			filtrosUsuario.setTipo(usuario.getTipo());
			filtrosUsuario.setStatus(usuario.getStatus());
			usuarioService.actualizaUsuario(filtrosUsuario);
			update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

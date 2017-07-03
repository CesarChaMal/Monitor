package com.monitor.filter;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import com.monitor.util.Util;

@ManagedBean(name="filtrosUsuario")
@SessionScoped
public class FiltrosUsuario extends Filtros {

	private String cveClipro;
	private String cveCliproNombre;
	private String email;
	private String nombre;
	private String apellidos;
    private String contrasena;
    private Date fechaAlta = null;
    private Integer status;
    private Integer tipo;
    
	private Util util = new Util();
    
	public String getCveClipro() {
		return cveClipro;
	}
	public void setCveClipro(String cveClipro) {
		this.cveClipro = cveClipro;
	}
	public String getCveCliproNombre() {
		return cveCliproNombre;
	}
	public void setCveCliproNombre(String cveCliproNombre) {
		this.cveCliproNombre = cveCliproNombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public Date getFechaAlta() throws Exception {
		return util.formatDate(fechaAlta);
	}
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
    public Integer getTipo() {
		return tipo;
	}
	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}
	public Util getUtil() {
		return util;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
}
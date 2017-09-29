package com.monitor.model;
// Generated 23/06/2017 12:40:03 PM by Hibernate Tools 5.2.3.Final

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * Usuario generated by hbm2java
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Table(name = "USUARIO", schema = "MONITOR")
public class Usuario  implements Serializable {
	private String email;
	private CliPro cliPro;
	private String nombre;
	private String apellidos;
	private String contrasena;
	private int tipo;
	private Date fechaalta;
	private Integer status;
	private Set<Foto> fotos = new HashSet<Foto>(0);

	public Usuario() {
	}

	public Usuario(String email, int tipo) {
		this.email = email;
		this.tipo = tipo;
	}

	public Usuario(String email, CliPro cliPro, String nombre, String apellidos, String contrasena, int tipo,
			Date fechaalta, Integer status, Set<Foto> fotos) {
		this.email = email;
		this.cliPro = cliPro;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.contrasena = contrasena;
		this.tipo = tipo;
		this.fechaalta = fechaalta;
		this.status = status;
		this.fotos = fotos;
	}

	@Id

	@Column(name = "EMAIL", unique = true, nullable = false, length = 20)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CVE_CLIPRO")
	public CliPro getCliPro() {
		return this.cliPro;
	}

	public void setCliPro(CliPro cliPro) {
		this.cliPro = cliPro;
	}

	@Column(name = "NOMBRE", length = 50)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "APELLIDOS", length = 50)
	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	@Column(name = "CONTRASENA", length = 10)
	public String getContrasena() {
		return this.contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	@Column(name = "TIPO", nullable = false, precision = 6, scale = 0)
	public int getTipo() {
		return this.tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "FECHAALTA", length = 7)
	public Date getFechaalta() {
		return this.fechaalta;
	}

	public void setFechaalta(Date fechaalta) {
		this.fechaalta = fechaalta;
	}

	@Column(name = "STATUS", precision = 6, scale = 0)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Foto> getFotos() {
		return this.fotos;
	}

	public void setFotos(Set<Foto> fotos) {
		this.fotos = fotos;
	}

}

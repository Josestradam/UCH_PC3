package com.redsocial.entidad;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Periodico {
	
	private int idperiodico;
	
	private String nombre;
	
	private Double precio;
	
	private String serie;
	
	private String categoria;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechalanzamiento;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaedicion;
	
	private Pais pais;

	public int getIdperiodico() {
		return idperiodico;
	}

	public void setIdperiodico(int idperiodico) {
		this.idperiodico = idperiodico;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public String getSerie() {
		return serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Date getFechalanzamiento() {
		return fechalanzamiento;
	}

	public void setFechalanzamiento(Date fechalanzamiento) {
		this.fechalanzamiento = fechalanzamiento;
	}

	public Date getFechaedicion() {
		return fechaedicion;
	}

	public void setFechaedicion(Date fechaedicion) {
		this.fechaedicion = fechaedicion;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}
	
	
	
	
}

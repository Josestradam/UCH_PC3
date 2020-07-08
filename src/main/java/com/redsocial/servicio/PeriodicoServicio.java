package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.Periodico;

public interface PeriodicoServicio {

	public Periodico insertaActualizaPeriodico(Periodico obj);
	public void eliminaPeriodico(int idPeriodico);
	public List<Periodico> listaPeriodico();
	public List<Periodico> listaPeriodicoPorNombre(String nom);
	public List<Periodico> listaPeriodico(int idDeporte, String nombre);

}
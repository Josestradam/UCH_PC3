package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Periodico;
import com.redsocial.repositorio.PeriodicoRepositorio;

@Service
public class PeriodicoServicioImpl implements PeriodicoServicio{

	@Autowired
	private PeriodicoRepositorio repositorio;

	@Override
	public Periodico insertaActualizaPeriodico(Periodico obj) {
		return repositorio.insertaActualizaPeriodico(obj);
	}

	@Override
	public void eliminaPeriodico(int idPeriodico) {
		repositorio.eliminaPeriodico(idPeriodico);
	}

	@Override
	public List<Periodico> listaPeriodico() {
		return repositorio.listaPeriodico();
	}

	@Override
	public List<Periodico> listaPeriodicoPorNombre(String nom) {
		return repositorio.listaPeriodicoPorNombre(nom);
	}

	@Override
	public List<Periodico> listaPeriodico(int idPais, String nombre) {
		return repositorio.listaPeriodico(idPais, nombre);
	} 
	


}
package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Periodico;
import com.redsocial.servicio.PeriodicoServicio;

@Controller
public class PeriodicoCrudController {

	@Autowired
	private PeriodicoServicio servicio;
	
	@RequestMapping("/verCrudPeriodico")
	public String ver() {
		return "crudPeriodico";
	}
	
	@RequestMapping("/consultaCrudPeriodico")
	public String lista(String filtro, Model m) {
		List<Periodico> lista =  servicio.listaPeriodicoPorNombre(filtro+"%");
		m.addAttribute("periodicos", lista);
		return "crudPeriodico";
	}
	
	@RequestMapping("/registraActualizaCrudPeriodico")
	public String registraActualiza(Periodico obj, Model m) {
		servicio.insertaActualizaPeriodico(obj);
		List<Periodico> lista =  servicio.listaPeriodico();
		m.addAttribute("periodicos", lista);
		return "crudPeriodico";
	}
	
	@RequestMapping("/eliminaCrudPeriodico")
	public String elimina(int id, Model m) {
		servicio.eliminaPeriodico(id);
		List<Periodico> lista =  servicio.listaPeriodico();
		m.addAttribute("periodicos", lista);
		return "crudPeriodico";
	}
}

package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Periodico;
import com.redsocial.servicio.PeriodicoServicio;

@Controller
public class PeriodicoConsultaController {

	@Autowired
	private PeriodicoServicio servicio;
	
	@RequestMapping("/verConsultaPeriodico")
	public String ver() {
		return "consultaPeriodico";
	}
	
	@RequestMapping("/consultaPeriodico")
	public String lista(int idPais, String nombre, Model m) {
		List<Periodico> lista =  servicio.listaPeriodico(idPais, nombre+"%");
		m.addAttribute("periodicos", lista);
		return "consultaPeriodico";
	}
}

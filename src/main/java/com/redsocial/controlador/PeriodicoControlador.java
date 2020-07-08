package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Pais;
import com.redsocial.entidad.Periodico;
import com.redsocial.servicio.PaisServicio;
import com.redsocial.servicio.PeriodicoServicio;

@Controller
public class PeriodicoControlador {

	@Autowired
	private PeriodicoServicio periodicoServicio;
	
	@Autowired
	private PaisServicio paisServicio;

	@RequestMapping("/verPeriodico")
	public String ver() {
		return "registraPeriodico";
	}
	
	@RequestMapping("/cargaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisServicio.listaPais();
	}
	
	@RequestMapping("/registraPeriodico")
	public String metRegistra(Periodico obj,HttpSession session) {
		Periodico aux = periodicoServicio.insertaActualizaPeriodico(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitoso");
		}
		return "redirect:verPeriodico";
	}
}

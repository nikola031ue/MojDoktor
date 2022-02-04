package com.example.doktor.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.doktor.repository.DoktorRepository;
import com.example.doktor.repository.SpecijalizacijaRepository;

import model.Doktor;
import model.Specijalizacija;

@Controller
@ControllerAdvice
@RequestMapping(value = "/pacijent")
public class PacijentController {

	
	@Autowired
	SpecijalizacijaRepository specijalizacijaRepo;
	
	@Autowired
	DoktorRepository doktorRepo;
	
	@ModelAttribute("specijalizacije")
	public List<Specijalizacija> getSpec() {
		return specijalizacijaRepo.findAll();
	}
	
	@RequestMapping(value = "/pacijentPage", method = RequestMethod.GET)
	public String pacijentPage() {
		return "/pacijent/pacijent";
	}
	
	@RequestMapping(value="/izlistajDoktore", method=RequestMethod.GET)
	public String sveSpecijalizacije(HttpServletRequest request, Integer idSpecijalizacija) {
		Specijalizacija s = specijalizacijaRepo.findById(idSpecijalizacija).get();
		List<Doktor> doktori = doktorRepo.findBySpecijalizacija(s);
		request.getSession().setAttribute("doktori", doktori);
		return "/pacijent/pacijent";
	}
	
	@RequestMapping(value="/zakazi", method=RequestMethod.POST)
	public String zakazivanje() {
		
		return "/pacijent/pacijent";
	}
}

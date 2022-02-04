package com.example.doktor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.doktor.repository.SpecijalizacijaRepository;

import model.Specijalizacija;

@Controller
@RequestMapping(value = "/spec")
public class SpecijalizacijaController {

	@Autowired
	SpecijalizacijaRepository specRepo;

	@ModelAttribute("specijalizacije")
	public List<Specijalizacija> getSpecijalizacijeAll() {
		return specRepo.findAll();
	}

	@RequestMapping(value = "/saveSpec", method = RequestMethod.POST)
	public String saveSpecijalizacija(Model m, String specijalizacija) {
		Specijalizacija spec = new Specijalizacija();
		spec.setNaziv(specijalizacija);

		Specijalizacija sp = specRepo.save(spec);
		m.addAttribute("specijal", sp);
		m.addAttribute("porukaSpec", "Uspesno sacuvana specijalizacija ");
		return "admin/admin";
	}

	@RequestMapping(value = "/specPage", method = RequestMethod.GET)
	public String loginPage() {
		return "admin/admin";
	}

	@RequestMapping(value = "/getSveSpec", method = RequestMethod.GET)
	public String getSveLekove(Model m) {
		List<Specijalizacija> specs = specRepo.findAll();
		boolean showSpec = true;
		m.addAttribute("showSpec", showSpec);
		m.addAttribute("sveSpecijalizacije", specs);
		return "admin/admin";
	}
	
	// TODO kaskadno slicno kao za korisnika 
	@RequestMapping(value = "/deleteId", method = RequestMethod.GET)
	public String deleteDoktor(Integer idDoktor) {
		
//		Korisnik k = korisnikRepo.findDoktor(idDoktor);
//		
//		Doktor dok = doktorRepo.findById(idDoktor).get();
//		dok.removeKorisnik(k);
//		korisnikRepo.delete(k);
//		doktorRepo.delete(dok);
		
		return "admin/admin";
	}
	
	
}

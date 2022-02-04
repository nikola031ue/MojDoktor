package com.example.doktor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.doktor.repository.DoktorRepository;
import com.example.doktor.repository.KorisnikRepository;

import model.Doktor;
import model.Korisnik;

@Controller
@ControllerAdvice
@RequestMapping(value = "/doktor")
public class DoktorController {
	
	@Autowired
	DoktorRepository doktorRepo;
	
	@Autowired
	KorisnikRepository korisnikRepo;
	
	@RequestMapping(value = "/getSveDoktore", method = RequestMethod.GET)
	public String getSveLekove(Model m) {
		List<Doktor> docs = doktorRepo.findAll();
		boolean showDoc = true;
		m.addAttribute("showDoc", showDoc);
		m.addAttribute("sviDoktori", docs);
		return "admin/admin";
	}
	
	@RequestMapping(value = "/deleteId", method = RequestMethod.GET)
	public String deleteDoktor(Integer idDoktor) {
		
		Korisnik k = korisnikRepo.findDoktor(idDoktor);
		
		Doktor dok = doktorRepo.findById(idDoktor).get();
		dok.removeKorisnik(k);
		korisnikRepo.delete(k);
		doktorRepo.delete(dok);
		
		return "admin/admin";
	}

}

package com.example.doktor.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.doktor.repository.LekDijagnozaRepository;
import com.example.doktor.repository.LekRepository;

import model.Lek;
import model.Lekdijagnoza;

@Controller
@RequestMapping(value = "/lekovi")
public class LekController {

	@Autowired
	LekRepository lekRepo;
	
	@Autowired
	LekDijagnozaRepository lekDijRepo;

	@RequestMapping(value = "/saveLek", method = RequestMethod.POST)
	public String saveLek(String lekNaziv, Model m) {
		Lek l = new Lek();
		l.setNaziv(lekNaziv);

		Lek lekic = lekRepo.save(l);
		m.addAttribute("lek", lekic);
		m.addAttribute("porukaLek", "Uspesno sacuvan lek ");
		return "admin/admin";
	}

	@RequestMapping(value = "/lekPage", method = RequestMethod.GET)
	public String loginPage() {
		return "admin/admin";
	}

	@RequestMapping(value = "/getSveLekove", method = RequestMethod.GET)
	public String getSveLekove(Model m) {
		List<Lek> lekovi = lekRepo.findAll();
		boolean showLek = true;
		m.addAttribute("sviLekovi", lekovi);
		m.addAttribute("showLek", showLek);
		return "admin/admin";
	}
	
	@RequestMapping(value = "/deleteId", method = RequestMethod.GET)
	public String deleteDoktor(Integer idLek) {
		
		Lek l = lekRepo.findById(idLek).get();
		
		Lekdijagnoza ld = lekDijRepo.findLekDij(idLek);
		
		ld.setLek(null);
		lekRepo.delete(l);
		
//		Doktor dok = doktorRepo.findById(idDoktor).get();
//		dok.removeKorisnik(k);
//		korisnikRepo.delete(k);
//		doktorRepo.delete(dok);
		
		return "admin/admin";
	}
}

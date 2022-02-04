package com.example.doktor.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.doktor.repository.DoktorRepository;
import com.example.doktor.repository.KorisnikRepository;
import com.example.doktor.repository.PacijentRepository;
import com.example.doktor.repository.SpecijalizacijaRepository;
import com.example.doktor.repository.UlogaRepository;

import model.Doktor;
import model.Korisnik;
import model.Pacijent;
import model.Specijalizacija;
import model.Uloga;

@Controller
@ControllerAdvice
@RequestMapping(value = "auth")
public class LoginController {

	@Autowired
	KorisnikRepository korisnikRepo;

	@Autowired
	UlogaRepository ulogaRepo;

	@Autowired
	DoktorRepository doktorRepo;

	@Autowired
	PacijentRepository pacijentRepo;

	@Autowired
	SpecijalizacijaRepository specijalizacijaRepo;

	// uklonimo ADMINA da se ne bi niko registrovao kao admin
	@ModelAttribute
	public void getUloge(Model model) {
		List<Uloga> uloge = ulogaRepo.findAll();
		uloge.remove(0);
		model.addAttribute("uloge", uloge);
	}

	@ModelAttribute
	public void getSpec(Model model) {
		List<Specijalizacija> specijalizacije = specijalizacijaRepo.findAll();
		model.addAttribute("specijalizacije", specijalizacije);
	}

	// vraca nas na login.jsp
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "/logovanje/login";
	}

//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String loginHello() {
//		return "hello";
//	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.GET)
	public String newUser(Model model) {
//		BibliotekaKorisnik u = new BibliotekaKorisnik();
//		model.addAttribute("user", u);
		return "/logovanje/register";
	}

	// dodaje korisnika i doktora ili pacijenta
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(String username, String password, String ime, String prezime, Integer idUloga,
			Integer idSpecijalizacija, Model m) {
		Uloga u = ulogaRepo.findById(idUloga).get();
		Specijalizacija s = specijalizacijaRepo.findById(idSpecijalizacija).get();

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		if (u.getNaziv().equalsIgnoreCase("doktor")) {
			Doktor doktor;
			Korisnik korisnik;
			try {
				Doktor d = new Doktor();
				d.setIme(ime);
				d.setPrezime(prezime);
				d.setSpecijalizacija(s);

				Korisnik k = new Korisnik();
				k.setDoktor(d);
				k.setUsername(username);
				k.setPassword(passwordEncoder.encode(password));
				k.setUloga(u);

				doktor = doktorRepo.save(d);
				korisnik = korisnikRepo.save(k);

				m.addAttribute("korisnik", korisnik);
				m.addAttribute("doktor", doktor);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return "/logovanje/login";
		} else if (u.getNaziv().equalsIgnoreCase("pacijent")) {
			try {
				Pacijent p = new Pacijent();
				p.setIme(ime);
				p.setPrezime(prezime);

				Korisnik k = new Korisnik();
				k.setPacijent(p);
				k.setUsername(username);
				k.setPassword(passwordEncoder.encode(password));
				k.setUloga(u);

				Pacijent pacijent = pacijentRepo.save(p);
				Korisnik korisnik = korisnikRepo.save(k);

				m.addAttribute("korisnik", korisnik);
				m.addAttribute("pacijent", pacijent);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return "/logovanje/login";
		} else {
			return "redirect:/auth/loginPage";
		}
	}

	// odjava
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
		}

		return "redirect:/auth/loginPage";
	}

	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String getPocetna() {
		return "/pocetna";
	}

}

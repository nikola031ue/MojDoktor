package com.example.doktor.config;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.doktor.repository.KorisnikRepository;

import model.Korisnik;
import model.Uloga;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private KorisnikRepository korisnikRepo;
	
	@SuppressWarnings("unchecked")
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Korisnik korisnik = korisnikRepo.findByUsername(username);
		UserDetailsImpl userDetails = new UserDetailsImpl();
		userDetails.setUsername(korisnik.getUsername());
		userDetails.setPassword(korisnik.getPassword());
		userDetails.setRoles((Set<Uloga>) korisnik.getUloga());
		return userDetails;
	}

}

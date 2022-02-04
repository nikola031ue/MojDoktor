package com.example.doktor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Korisnik;

@Repository
@Transactional
public interface KorisnikRepository extends JpaRepository<Korisnik, Integer>{
	
	Korisnik findByUsername(String username);
	
	@Query("SELECT k FROM Korisnik k INNER JOIN k.doktor d WHERE d.idDoktor = :id")
	Korisnik findDoktor(@Param("id")Integer id);
	
}

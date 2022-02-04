package com.example.doktor.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import model.Doktor;
import model.Specijalizacija;

@Repository
@Transactional
public interface DoktorRepository extends JpaRepository<Doktor, Integer>{
	Optional<Doktor> findById(Integer id);
	
//	@Query("SELECT d FROM Doktor d INNER JOIN Specijalizacija s WHERE d.specijalizacija = s.idSpecijalizacija AND d.ime NOT LIKE 'admin'")
	List<Doktor> findBySpecijalizacija(Specijalizacija s);
}

package com.example.doktor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Lekdijagnoza;

@Repository
@Transactional
public interface LekDijagnozaRepository extends JpaRepository<Lekdijagnoza, Integer>{
	
	@Query("SELECT ld FROM Lekdijagnoza ld INNER JOIN ld.lek l WHERE l.idLek = :id")
	Lekdijagnoza findLekDij(@Param("id")Integer id);
}

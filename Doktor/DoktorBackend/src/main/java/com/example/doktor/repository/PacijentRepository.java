package com.example.doktor.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Pacijent;

@Repository
@Transactional
public interface PacijentRepository extends JpaRepository<Pacijent, Integer>{

}

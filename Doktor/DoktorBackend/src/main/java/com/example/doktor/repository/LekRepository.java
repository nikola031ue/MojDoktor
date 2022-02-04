package com.example.doktor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Lek;

@Repository
@Transactional
public interface LekRepository extends JpaRepository<Lek, Integer> {

}

package com.example.doktor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Pregled;

@Repository
@Transactional
public interface PregledRepository extends JpaRepository<Pregled, Integer> {

}

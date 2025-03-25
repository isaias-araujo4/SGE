package com.example.demo.repositorio;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.obra.ObraModelo;

@Repository
public interface ObraRepositorio extends CrudRepository<ObraModelo, Long>{
    Optional<ObraModelo> findfindByNome(String nome);
} 
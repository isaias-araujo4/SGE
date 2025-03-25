package com.example.demo.servico;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.modelo.obra.ObraModelo;
import com.example.demo.modelo.obra.RespostaObra;
import com.example.demo.repositorio.ObraRepositorio;

@Service
public class ObraServico {

    @Autowired
    private ObraRepositorio or;

    @Autowired
    private RespostaObra ro;

    // método para listar obras
    public Iterable<ObraModelo> listar() {
        return or.findAll();
    }

    // método para cadastrar ou editar obras
    public ResponseEntity<?> cadastrarEditar(ObraModelo om, String acao) {
        if (om.getNome().equals("")) {
            ro.setMensagem("O nome da obra é obrigatótio");
            return new ResponseEntity<RespostaObra>(ro, HttpStatus.BAD_REQUEST);
        } else {
            if (acao.equals("cadastrar")) {
                return new ResponseEntity<ObraModelo>(or.save(om), HttpStatus.CREATED);
            } else {
                return new ResponseEntity<ObraModelo>(or.save(om), HttpStatus.OK);
            }
        }
    }

    // método para deletar uma obra
    public ResponseEntity<RespostaObra> deletar(Long codigo) {
        Optional<ObraModelo> obraOptional = or.findById(codigo);

        if (obraOptional.isPresent()) {
            ObraModelo obra = obraOptional.get();
            or.deleteById(codigo);

            ro.setMensagem("A obra '" + obra.getNome() + "' foi deletada com sucesso");
            return new ResponseEntity<>(ro, HttpStatus.OK);
        } else {
            ro.setMensagem("Obra não encontrada");
            return new ResponseEntity<>(ro, HttpStatus.NOT_FOUND);
        }
    }

}

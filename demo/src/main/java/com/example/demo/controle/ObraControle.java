package com.example.demo.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.obra.ObraModelo;
import com.example.demo.modelo.obra.RespostaObra;
import com.example.demo.servico.ObraServico;

@RestController
public class ObraControle {
    
    @Autowired
    private ObraServico os;

    //rota para listar obras
    @GetMapping("/listarObras")
    public Iterable<ObraModelo> listar(){
        return os.listar();
    }

    //rota para cadastrar obras
    @PostMapping("/cadastrarObras")
    public ResponseEntity<?>cadastrar(@RequestBody ObraModelo om){
        return os.cadastrarEditar(om, "cadastrar");
    }
    
    //rota para editar obras
    @PutMapping("/editarObras")
    public ResponseEntity<?>editar(@RequestBody ObraModelo om){
        return os.cadastrarEditar(om, "editar");
    }

    //rota para deletar obra
    @DeleteMapping("/deletar/{codigo}")
    public ResponseEntity<RespostaObra> deletar(@PathVariable Long codigo){
        return os.deletar(codigo);
    }
}

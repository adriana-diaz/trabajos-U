package com.semana6practica.semana6;

import java.util.List;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class RestPedidosController {
    
    @GetMapping("/pedido") //methodo GET
    public Pedido getPedido() {
        return new Pedido("Jugo de Naranja", "Bebidas", "9");
    }

    @GetMapping("/pedidos") //methodo GET
    public void getpedidos() {
       Pedido pediList = new Pedido();
         pediList.getpedidos();
    }

    @PostMapping("/pedido") //methodo POST
    public void addPedido(String name, String type, String quantity){
        Pedido pedido = new Pedido( name,  type,  quantity);
        pedido.addPedido(pedido);
        pedido.getpedidos();
    }

     @PutMapping("/pedido") //methodo PUT
    public void editPedido(String name, String type, String quantity, int descripcion){
        Pedido pedido = new Pedido( name,  type,  quantity);
        pedido.updateListMember(pedido,descripcion);
        pedido.getpedidos();
    }
    @DeleteMapping("/pedido") //methodo DELETE
    public void delPedido(int descripcion ){
        Pedido pedido = new Pedido();
        pedido.genPedidos();
        pedido.genPedidos();
        pedido.removePedido(descripcion);
        pedido.genPedidos();
    }

}

package com.semana6practica.semana6;

import java.util.ArrayList;
import java.util.List;

public class Pedido {

    private String name;
    private String type;
    private String quantity;
  

    private List<Pedido> pedidos = new ArrayList<Pedido>();

    public Pedido(){};    
    public Pedido(String name, String type, String quantity) {
        this.name = name;
        this.type = type;
        this.quantity = quantity;
  
    }
    
    public String getName() {
        return name;
    }

    public void getpedidos() {
  

        for (Pedido pedidoIteracion : pedidos) {
            System.out.println(pedidoIteracion.getName());
        }
       
    }
    public void genPedidos() {
        Pedido pedido1 = new Pedido("Computadora", "Electronico", "1");
        Pedido pedido2 = new Pedido("Banano", "Fruta", "5");
        Pedido pedido3 = new Pedido("Lapiz ", "Utiles", "10");
        Pedido pedido4 = new Pedido("Jugo de Naranja", "Bebidas", "9");

        pedidos.add(pedido1);
        pedidos.add(pedido2);
        pedidos.add(pedido3);
        pedidos.add(pedido4);
 
       
    }

    public void addPedido(Pedido pedido)
    {
        pedidos.add(pedido);
    }
    public void removePedido(int descripcion) {
        pedidos.remove(descripcion);
    }



    public String getType() {
        return type;
    }

    public String getAmount() {
        return quantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
          this.type = type;
    }

    public void updateListMember (Pedido pedido, int descripcion) {
        this.genPedidos();
        pedidos.set(descripcion, pedido);
        this.getpedidos();



    }
}

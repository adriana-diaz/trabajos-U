# Configuración de un Router en Cisco Packet Tracer

## Configurar una Interfaz FastEthernet (Fa)

Para configurar un router en Cisco Packet Tracer y utilizar una interfaz FastEthernet (Fa), sigue estos pasos:

1. `enable`
2. `configure terminal`
3. Accede a la interfaz FastEthernet que quieres configurar, por ejemplo:
4. Asigna una dirección IP y máscara de subred a la interfaz: `interface FastEthernet0/0`
5. Asigna una dirección IP y máscara de subred a la interfaz: `ip address [default gateway] [mascara de subred]`
6. `do wr`
7. `exit`

---

## Configuración del protocolo RIP en un Router Cisco Packet Tracer

Para configurar RIP en un router de Cisco Packet Tracer, sigue estos pasos:

1. `enable`
2. `configure terminal`
3. `router rip`
4. `version 2`
5. Usa el comando "net" para anunciar las redes conectadas al router.Por ejemplo, si tus redes son 192.168.1.0/24 y 10.0.0.0/8, usa los siguientes comandos:
net 192.168.1.0
net 10.0.0.0
6. `no auto-summary`
7.`do wr`
8.`exit`



   

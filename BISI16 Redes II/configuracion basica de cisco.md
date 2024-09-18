# Configuración de un Router en Cisco Packet Tracer

## Configurar una Interfaz FastEthernet (Fa)

Para configurar un router en Cisco Packet Tracer y utilizar una interfaz FastEthernet (Fa) y asignar la direccion IP, sigue estos pasos:

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
`net 192.168.1.0`
`net 10.0.0.0`
6. `no auto-summary`
7.`do wr`
8.`exit`

---
## Convertir un switch de capa 3 a un router
1. `enable`
2. `configure terminal`
3. `ip routing`
4. `inter range fa 0/1-24`
5. `no sh`
6. `do wr`
7. `exit`

---
## Implementacion de VLANS para asignar troncales 
Usare un ejemplo donde tengo 2 PC, PC1 con vlan 5 y PC2 con vlan 7, ambas van a dar con un switch y este a un router

Paso 1: Configurar las VLANs en los Switches
Configurar el Switch1 (donde están conectados los PCs de las VLANs 5 y 7)
1. `enable`
2. `configure terminal`
3. Crear las vlans: `vlan 5`-> `name VLAN5` -> `exit`
4. Crear las vlans: `vlan 7`-> `name VLAN7` -> `exit`
5. Asigna las interfaces a sus respectivas VLANs: Fa0/1 (donde está conectado PC1) -> `interface Fa0/1` -> `switchport mode access` -> `switchport access vlan 5` -> `exit`
6. Asigna las interfaces a sus respectivas VLANs: Fa0/2 (donde está conectado PC2) -> `interface Fa0/2` -> `switchport mode access` -> `switchport access vlan 7` -> `exit`

Paso 2: Configurar los puertos troncales
El enlace entre el Switch2 y el router debe configurarse como un enlace troncal para permitir la comunicación de las VLANs.
En Switch 2
1. `enable`
2. `configure terminal`
3. `interface Fa0/1`
4. `switchport mode trunk`
5. `exit`

Paso 3: Configurar el Router para Inter-VLAN Routing (Router on a Stick)
El router necesita subinterfaces para cada VLAN. Aquí está la configuración para tu router:
1. `enable`
2. `configure terminal`
3. Para la vlan 5 -> `interface FastEthernet0/1.5` -> `encapsulation dot1Q 5` -> `ip address [default gateway o red que prefiera ponerle] [mascara de subred]`-> `exit`
4. Para la vlan 7 -> `interface FastEthernet0/1.7` -> `encapsulation dot1Q 7` -> `ip address [default gateway o red que prefiera ponerle] [mascara de subred]`-> `exit`
---
## Examinar la configuración actual del switch 
Ejecutar el comando show running-config 
Switch> show running-config 

---
## Asignar una contraseña en un dispositivo Cisco
Contraseña en la consola (para acceso físico)
1. `enable`
2. `configure terminal`
3. `line console 0`
4. `password TU_CONTRASEÑA_AQUI`
5. `login`
6. `exit`

Contraseña para acceso remoto (Telnet o SSH)
1. `enable`
2. `configure terminal`
3. `line vty 0 4`
4. `password TU_CONTRASEÑA_AQUI`
5. `login`
6. `exit`

## Contraseña para el modo privilegiado (enable password)
El modo privilegiado es el nivel de acceso que te permite hacer configuraciones. Para asegurar este acceso con una contraseña:
1. `enable`
2. `configure terminal`
3. `enable secret TU_CONTRASEÑA_AQUI`
4. `exit`

Guardar la configuración
Recuerda guardar la configuración para que se mantenga después de un reinicio: `write memory`

---
## Configuración de Router Inalámbrico en Cisco Packet Tracer (DHCP)
El protocolo de configuración dinámica de host (DHCP) es un protocolo de red que permite a un servidor DHCP/servidor de red asignar dinámicamente la dirección IP, la máscara de subred, los gateways predeterminados y otros parámetros de configuración de red a los dispositivos que lo soliciten.
1. Añadir un Router Inalámbrico: Arrastra el router inalámbrico a la topología en Cisco Packet Tracer.
1.1 Por ejmeplo el router `WRT300N` , lo apago fisicamente y le agrego el modulo correcto para que sirva wireless.
1.2 Voy a la pestaña `GUI` y pongo la red y mascara que guste. En la seccion de `Wireless`   
3. 
4. Configuración Básica del Router: Accede a la configuración del router y configura el nombre, la contraseña y otros parámetros básicos.
5. Configurar DHCP: Habilita el servidor DHCP en el router y define el rango de direcciones IP que se asignarán automáticamente a los dispositivos.
6. Configuración de Seguridad Inalámbrica: Configura el SSID y el tipo de seguridad (por ejemplo, WPA2) para la red inalámbrica.
7. Conexión de Dispositivos: Conecta dispositivos como computadoras portátiles y teléfonos al router inalámbrico.
8. Verificación de Conectividad: Verifica que los dispositivos reciban una dirección IP a través de DHCP y que puedan comunicarse con el router.

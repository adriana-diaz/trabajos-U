# Proceso de Renovación de un Arrendamiento DHCPv4

## ¿Qué es un arrendamiento en DHCP?
- **Arrendamiento (lease)**: Cuando un dispositivo se conecta a una red con DHCP, recibe una dirección IP por un **tiempo limitado**.
- El arrendamiento debe renovarse antes de que expire para mantener la dirección IP asignada.

## Proceso de Renovación de Arrendamiento

### 1. **DHCPREQUEST**:
   - Aproximadamente a la **mitad del tiempo** del arrendamiento, el cliente envía un mensaje **DHCPREQUEST** al servidor DHCP.
   - El cliente solicita seguir usando la misma dirección IP asignada originalmente.

### 2. **DHCPACK**:
   - El servidor responde con un **DHCPACK** si la dirección IP sigue disponible y válida.
   - Esto **extiende el tiempo** de uso de la dirección IP.

## ¿Qué pasa si no se puede renovar?
- Si el servidor no responde al **DHCPREQUEST**, el cliente intentará nuevamente más frecuentemente.
- Si el arrendamiento **expira completamente**, el cliente deberá iniciar el proceso de nuevo, enviando un **DHCPDISCOVER** para obtener una nueva dirección IP.

## Proceso Completo de DHCPv4
1. **DHCPDISCOVER**: El cliente envía este mensaje para localizar servidores DHCP.
2. **DHCPOFFER**: Los servidores disponibles responden con una oferta de dirección IP.
3. **DHCPREQUEST**: El cliente selecciona una oferta y solicita la dirección IP.
4. **DHCPACK**: El servidor confirma la asignación de la IP al cliente.

## Resumen del Proceso de Renovación
- A la mitad del arrendamiento, el cliente envía un **DHCPREQUEST**.
- El servidor responde con un **DHCPACK** para renovar el arrendamiento.
- Si el arrendamiento expira, el cliente deberá iniciar el proceso de nuevo.



 
# Resumen de HSRP (Hot Standby Router Protocol)

## Prioridad HSRP
- La **prioridad HSRP** predeterminada es **100**.
- Un router con una **prioridad más alta** tomará el rol de **router activo** si se une a la red, desplazando a uno con menor prioridad.

## Estados de HSRP
1. **Inicial**: El router está iniciando y no ha determinado la configuración HSRP.
2. **Escuchar**: 
   - El router escucha mensajes de otros routers.
   - Comienza a enviar **mensajes de saludo periódicos**.
3. **Hablar**:
   - El router asume el rol de **router activo** y envía mensajes de saludo a otros routers.
4. **Aprendizaje**: 
   - El router no ha determinado la dirección IP virtual y está aprendiendo la configuración HSRP.
   - No participa en el proceso activo/en espera hasta que tenga la información necesaria.

## Características
- En el estado de aprendizaje, el router no ha determinado la dirección IP virtual.
- En el estado de escucha, el router escucha los mensajes HSRP de otros routers en la red.

## Función
- HSRP proporciona **redundancia** y **alta disponibilidad** para routers en una red, asegurando que el tráfico continúe fluyendo en caso de fallo de un router activo.

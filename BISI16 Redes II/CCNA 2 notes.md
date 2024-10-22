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

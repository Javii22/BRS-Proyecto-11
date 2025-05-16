# Enlace a la presentacion

[Presentacion](https://www.canva.com/design/DAGneBKw5a4/GJmdq9ATektK2MQTbwczVA/edit)



# 1. Despliegue y configuración automatizada de la infraestructura

## 1.1 Preparación del entorno
Se empleó una máquina virtual Ubuntu 22.04 conectada mediante adaptador puente. Este entorno se desplegó automáticamente utilizando Terraform, y su configuración fue aplicada mediante Ansible y verificada con InSpec.

## 1.2 Automatización con Terraform
Terraform permitió definir y aprovisionar la máquina virtual base, asegurando coherencia y repetibilidad en el entorno de pruebas. La configuración incluyó:

*   Asignación de 2 CPU y 2 GB de RAM.
*   Montaje de una imagen base Ubuntu Server.
*   Red en modo puente para interacción directa con el cortafuegos.

Archivo utilizado: `main.tf`.

## 1.3 Configuración con Ansible
La configuración de la VM se automatizó con Ansible, incluyendo:

*   Instalación de paquetes de auditoría (`auditd`, `rsyslog`, `tcpdump`).
*   Activación del cortafuegos UFW con reglas restrictivas.
*   Desactivación de servicios innecesarios (Samba, FTP).
*   Endurecimiento de la configuración SSH (bloqueo de acceso root).

El playbook garantizó una base segura sobre la que ejecutar simulaciones posteriores.

Archivo utilizado: `playbook.yml`.

## 1.4 Verificación con InSpec
Se empleó InSpec para validar la configuración aplicada:

*   Se comprobó que el cortafuegos estuviera activo.
*   Se verificó que solo los puertos autorizados (22 y 80) estaban abiertos.
*   Se comprobó la correcta configuración del demonio SSH.
*   Se aseguró que servicios como `smbd` o `ftp` estuvieran desactivados.

Archivo utilizado: `controles.rb`.

## 1.5 Resultado
La verificación fue satisfactoria. Todos los tests pasaron correctamente. El sistema quedó configurado de forma segura y lista para pruebas de emulación de adversarios.

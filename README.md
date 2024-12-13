# Mi Proyecto Rails

# Avivas Store - Aplicación de Gestión de Tienda de Ropa

## Descripción del Proyecto
Avivas es una aplicación web desarrollada en Ruby on Rails que simula un sistema de gestión de tienda de ropa. Permite la administración de productos, usuarios, ventas y clientes de manera integral y eficiente.

## Versiones de Tecnologías
- **Ruby:** 3.3.6
- **Rails:** 8.0.0
- **Base de Datos:** SQLite3

## Gemas y Servicios Utilizados

### Autenticación y Sesiones
**Devise** se utilizó para manejar la autenticación de usuarios. Esta gema facilita:
- Registro de usuarios
- Inicio y cierre de sesión
- Gestión de contraseñas
- Control de acceso basado en roles

### Permisos y Autorización
**Pundit** fue implementado para el control de permisos, permitiendo:
- Definir políticas de acceso granulares
- Restringir acciones según el rol del usuario
- Gestionar permisos de manera clara y semántica

### Búsqueda y Filtrado
**Ransack** se integró para proporcionar capacidades avanzadas de:
- Búsqueda de productos
- Filtrado dinámico

## Roles de Usuario
La aplicación contempla tres roles de usuario:
- **Administrador:** Control total del sistema
- **Supervisor:** Permisos administrativos limitados
- **Empleado:** Acceso básico a funcionalidades

### Funcionalidades de Usuarios
- Registro con correo electrónico
- Autenticación segura
- Bloqueo de usuarios por administradores
- Asignación de roles

## Gestión de Productos
- Validaciones de stock
- Filtrado y búsqueda de productos

## Ventas
- Flexibilidad para clientes nuevos o existentes
- Gestión de ítems de venta

## Requisitos del Sistema
- **Sistemas Operativos:** Linux, macOS, Windows
- **Gestores de Paquetes:** rbenv, RVM

## Instalación y Configuración

1. **Clonar el repositorio:**
   ```bash
   git clone git@github.com:Julian-Garcia-Massacanne/StoreFront-rails.git

2. **Navegar hasta el proyecto e instalar dependencias:**
    cd StoreFront
    bundle install

3. **Iniciar y cargar la base de datos**
   
   rails db:create
   rails db:migrate
   rails db:seed

4. **Correr el servicio**

   rails s



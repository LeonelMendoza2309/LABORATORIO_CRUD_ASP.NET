# CRUD con ASP.NET y MySQL

Aplicación web CRUD desarrollada en **ASP.NET Web Forms** con C# y conectada a una base de datos **MySQL**. Permite crear, consultar, actualizar y eliminar usuarios desde una interfaz web.

## Capturas de pantalla

- **Pantalla principal:**  
 <img width="1365" height="442" alt="image" src="https://github.com/user-attachments/assets/6d371fce-5e43-4a10-be66-2c5d85435b3b" />

- **Crear usuario:**  
<img width="1360" height="614" alt="image" src="https://github.com/user-attachments/assets/6a44ff81-cc82-4e92-9fa2-a7c9860e853c" />

- **Consultar/Actualizar/Eliminar:**  
<img width="492" height="570" alt="image" src="https://github.com/user-attachments/assets/e0616e95-913e-4cff-a49d-7ebbafd3a638" />
<img width="485" height="546" alt="image" src="https://github.com/user-attachments/assets/46d76492-ba96-43f5-a59a-f11a284922bf" />
<img width="485" height="545" alt="image" src="https://github.com/user-attachments/assets/b69bbffb-f41d-4509-91ae-0a4a4869f172" />


## Funcionalidades

- Crear un usuario.
- Consultar el listado de usuarios.
- Mostrar los datos de un usuario.
- Actualizar nombre, edad, correo y fecha de nacimiento.
- Eliminar un usuario.
- Ejecutar las operaciones mediante procedimientos almacenados de MySQL.

## Tecnologías utilizadas

- C#
- ASP.NET Web Forms
- .NET Framework 4.7.2
- MySQL
- MySQL Connector/NET
- Bootstrap
- Visual Studio

## Base de datos

El proyecto incluye el archivo `dbCRUD.sql`, que crea:

- La base de datos `dbCRUD`.
- La tabla `Usuarios`.
- Los procedimientos almacenados:
  - `sp_load`: muestra todos los usuarios.
  - `sp_create`: crea un usuario.
  - `sp_read`: consulta un usuario por identificador.
  - `sp_update`: actualiza los datos de un usuario.
  - `sp_delete`: elimina un usuario.

### Campos de la tabla Usuarios

| Campo | Tipo | Descripción |
|---|---|---|
| Id_Usuario | INT, AUTO_INCREMENT | Identificador único |
| Nombre | VARCHAR(15) | Nombre del usuario |
| Edad | INT | Edad del usuario |
| Correo | VARCHAR(200) | Correo electrónico |
| Fecha_Nacimiento | DATE | Fecha de nacimiento |

## Instalación

### 1. Crear la base de datos

Abrir MySQL Workbench o una terminal de MySQL y ejecuta:

```sql
source dbCRUD.sql
```

### 2. Configurar la conexión

En el archivo:

```text
WEB HPA3/CRUD/Web.config
```

actualiza la cadena de conexión dentro de `<connectionStrings>` con los datos de tu servidor MySQL:

```xml
<add name="conexion"
     connectionString="Server=localhost;Database=dbCRUD;Uid=TU_USUARIO;Pwd=TU_CONTRASENA;"
     providerName="MySql.Data.MySqlClient" />
```

### 3. Ejecutar el proyecto

1. Abre `WEB HPA3/CRUD/CRUD.slnx` en Visual Studio.
2. Restaura los paquetes NuGet si Visual Studio lo solicita.
3. Ejecuta el proyecto con IIS Express.
4. Abre la página `Pages/Index.aspx`.

## Uso

1. Haz clic en **Crear** para agregar un usuario.
2. Completa el nombre, edad, correo y fecha de nacimiento.
3. Usa **Leer** para consultar un registro.
4. Usa **Actualizar** para modificar sus datos.
5. Usa **Borrar** para eliminar el registro.

## Estructura principal

```text
LABORATORIO_CRUD_ASP.NET/
├── dbCRUD.sql
└── WEB HPA3/
    └── CRUD/
        ├── Pages/
        │   ├── Index.aspx
        │   ├── CRUD.aspx
        │   └── código C# asociado
        ├── MP.Master
        ├── Web.config
        ├── CRUD.csproj
        └── packages.config
```

## Autor

Leonel Mendoza

create database dbCRUD;
use dbCRUD;

create table Usuarios(
	Id_Usuario int AUTO_INCREMENT primary key,
	Nombre varchar(15),
	Edad int,
	Correo varchar(200),
	Fecha_Nacimiento date
);

DELIMITER $$
create procedure sp_load()
begin
	select * from Usuarios;
End
$$
drop procedure sp_create;
DELIMITER $$

create procedure sp_create(
    in p_Nombre varchar(15),
    in p_Edad int,
    in p_Correo varchar(200),
    in p_Fecha date
)
begin
    insert into Usuarios (Nombre, Edad, Correo, Fecha_Nacimiento)
    values (p_Nombre, p_Edad, p_Correo, p_Fecha);
end $$
DELIMITER ;

DESCRIBE Usuarios;
ALTER TABLE Usuarios
MODIFY COLUMN Id_Usuario INT NOT NULL AUTO_INCREMENT;

DELIMITER $$

CREATE PROCEDURE sp_read(
    IN p_Id INT
)
BEGIN
    SELECT *
    FROM Usuarios
    WHERE Id_Usuario = p_Id;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_update(
    IN p_Id_Usuario INT,
    IN p_Nombre VARCHAR(15),
    IN p_Edad INT,
    IN p_Correo VARCHAR(200),
    IN p_Fecha_Nacimiento DATE
)
BEGIN
    UPDATE Usuarios
    SET Nombre = p_Nombre,
        Edad = p_Edad,
        Correo = p_Correo,
        Fecha_Nacimiento = p_Fecha_Nacimiento
    WHERE Id_Usuario = p_Id_Usuario;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_delete(
    IN p_Id_Usuario INT
)
BEGIN
    DELETE FROM Usuarios
    WHERE Id_Usuario = p_Id_Usuario;
END $$

DELIMITER ;

select * from Usuarios;
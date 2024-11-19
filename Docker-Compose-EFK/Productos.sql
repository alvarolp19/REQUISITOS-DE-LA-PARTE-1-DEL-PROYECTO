CREATE TABLE Productos(
  idProducto serial PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  descripcion varchar(500) NOT NULL,
  foto varchar(100) NOT NULL
) ;
INSERT INTO Productos (idProducto, nombre, descripcion, foto) VALUES
(1, 'Ordenador ASUS', 'Portátil ligero y muy recomendable', 'foto1.png'),
(2, 'Ordenador MSI', 'Portatil alta gama', 'foto2.png');


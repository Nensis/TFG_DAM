CREATE DATABASE IF NOT EXISTS DadoPlateado;
USE DadoPlateado;

CREATE TABLE IF NOT EXISTS Socio(
dni CHAR(8) UNIQUE NOT NULL,
nombreSocio VARCHAR(50) NOT NULL,
apellidosSocio VARCHAR(70) NOT NULL,
fechaNacimiento DATE NOT NULL,
edad INT,
tlf INT NOT NULL,
nSocio INT UNIQUE NOT NULL auto_increment,
fechaIngreso DATE,
fotoSocio BIT,
email VARCHAR(70) NOT NULL,
contraseña VARCHAR(30) NOT NULL,
PRIMARY KEY (dni) 
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Juego(
nombreJuego VARCHAR(70) NOT NULL,
dni CHAR(8) UNIQUE NOT NULL,
edadJugar INT NOT NULL,
fotoJuego BIT NOT NULL,
descrJuego VARCHAR(200) NOT NULL,
fechaPrestamo date NOT NULL,
horaPrestamo date NOT NULL,
fechaDevolucion date NOT NULL,
horaDevolucion date NOT NULL,
PRIMARY KEY (nombreJuego),
FOREIGN KEY(dni) REFERENCES Socio(dni)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Tipo(
idTipo CHAR(6) UNIQUE NOT NULL,
nombreJuego VARCHAR(70) NOT NULL,
nombreTipo VARCHAR(70) NOT NULL,
PRIMARY KEY (idTipo),
FOREIGN KEY(nombreJuego) REFERENCES Juego (nombreJuego)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Cuota(
fechaCuota DATE NOT NULL,
PRIMARY KEY (fechaCuota)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Paga(
dni CHAR(8) UNIQUE NOT NULL,
fechaCuota DATE NOT NULL,
importe FLOAT NOT NULL,
pagada BOOL NOT NULL,
FOREIGN KEY (dni) REFERENCES Socio(dni),
FOREIGN KEY (fechaCuota) REFERENCES Cuota(fechaCuota)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Documentos(
nombreDoc VARCHAR(30) NOT NULL,
fichero BIT NOT NULL,
PRIMARY KEY(nombreDoc)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Accede(
nombreDoc VARCHAR(30) NOT NULL,
dni CHAR(8) UNIQUE NOT NULL,
FOREIGN KEY (nombreDoc) REFERENCES Documentos(nombreDoc),
FOREIGN KEY (dni) REFERENCES Socio(dni)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Noticia(
idNoticia INT NOT NULL auto_increment,
titulo VARCHAR(100) NOT NULL,
fechaPublicacion DATE NOT NULL,
fotoNoticia BIT,
texto VARCHAR(2000) NOT NULL,
PRIMARY KEY(idNoticia)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Calendario(
idCalendario INT NOT NULL auto_increment,
evento VARCHAR(70) NOT NULL,
descrEvento VARCHAR(100),
fechaEvento DATE NOT NULL,
PRIMARY KEY(idCalendario)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Contacto(
idContacto INT NOT NULL auto_increment,
emailContacto VARCHAR(70) NOT NULL,
nombreContacto VARCHAR(50) NOT NULL,
textoContacto VARCHAR(200),
PRIMARY KEY(idContacto)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Juntales(
dniJuntal CHAR(8) NOT NULL,
nombreJuntal VARCHAR(50) NOT NULL,
apellidosJuntal VARCHAR(70) NOT NULL,
fotoJuntal BIT,
cargo VARCHAR (30) NOT NULL,
descrJuntal VARCHAR(200) NOT NULL,
PRIMARY KEY (dniJuntal)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Suscripcion(
idSuscriptor INT NOT NULL,
emailSuscriptor VARCHAR(70) NOT NULL,
nombreSuscriptor VARCHAR(50) NOT NULL,
PRIMARY KEY(emailSuscriptor)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Sugerencia(
idSugerencia INT NOT NULL auto_increment,
emailSugerencia VARCHAR(70) NOT NULL,
nombreSugerencia VARCHAR(50) NOT NULL,
textoSugerencia VARCHAR(200) NOT NULL,
PRIMARY KEY(idSugerencia)
) ENGINE=INNODB;
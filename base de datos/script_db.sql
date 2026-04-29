
CREATE TABLE lugares (
                id_lugares INT NOT NULL,
                nombre VARCHAR(200) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                provincia VARCHAR(100) NOT NULL,
                municipio VARCHAR(100) NOT NULL,
                departamento VARCHAR(100) NOT NULL,
                ubicacion VARCHAR(300) NOT NULL,
                latitud DECIMAL NOT NULL,
                longitud DECIMAL NOT NULL,
                url DECIMAL NOT NULL,
                geolocalizacion DECIMAL(150) NOT NULL,
                PRIMARY KEY (id_lugares)
);


CREATE TABLE horarios (
                id_horarios INT NOT NULL,
                dia VARCHAR(50) NOT NULL,
                id_horarios_1 TIME NOT NULL,
                fin TIME NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_horarios)
);


CREATE TABLE funcionalidades (
                id_funcionalidades INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_funcionalidades)
);


CREATE TABLE roles (
                id_rol INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_rol)
);


CREATE TABLE privilegios (
                id_rol INT NOT NULL,
                id_funcionalidades INT NOT NULL,
                PRIMARY KEY (id_rol, id_funcionalidades)
);


CREATE TABLE personas (
                id_persona INT AUTO_INCREMENT NOT NULL,
                nombres VARCHAR(100) NOT NULL,
                primer_apellido VARCHAR(100) NOT NULL,
                segundo_apellido VARCHAR(100),
                ci INT NOT NULL,
                complemento VARCHAR(2),
                fecha_nacimiento DATE NOT NULL,
                genero VARCHAR(50) NOT NULL,
                direccion VARCHAR(200) NOT NULL,
                telefono_fijo INT,
                celular INT,
                email VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_persona)
);

ALTER TABLE personas COMMENT 'tabla de registros de personas';


CREATE TABLE usuario (
                id_persona INT AUTO_INCREMENT NOT NULL,
                usuario VARCHAR(50) NOT NULL,
                password VARCHAR(300) NOT NULL,
                PRIMARY KEY (id_persona)
);

ALTER TABLE usuario MODIFY COLUMN usuario VARCHAR(50) COMMENT 'unique';


CREATE UNIQUE INDEX usuario_idx
 ON usuario
 ( usuario );

CREATE TABLE favoritos (
                id_persona INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_persona, id_lugares)
);


CREATE TABLE comentarios (
                id_comentarios INT NOT NULL,
                id_persona INT NOT NULL,
                id_lugares INT NOT NULL,
                id_comentarios_1 VARCHAR(500) NOT NULL,
                calificacion INT NOT NULL,
                id_recomentario INT NOT NULL,
                fecha DATE NOT NULL,
                usuario_id_persona INT NOT NULL,
                id_recomentarios INT NOT NULL,
                PRIMARY KEY (id_comentarios, id_lugares)
);


CREATE TABLE fotos (
                id_fotos INT NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                descripcion_1 VARCHAR(150) NOT NULL,
                id_comentarios INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_fotos)
);


CREATE TABLE cuentas (
                id_persona INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_persona, id_rol)
);


ALTER TABLE comentarios ADD CONSTRAINT lugares_comentarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_favoritos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT lugares_fotos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE horarios ADD CONSTRAINT lugares_horarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcionalidades_privilegios_fk
FOREIGN KEY (id_funcionalidades)
REFERENCES funcionalidades (id_funcionalidades)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_cuentas_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuario ADD CONSTRAINT personas_usuario_fk
FOREIGN KEY (id_persona)
REFERENCES personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuario_cuentas_fk
FOREIGN KEY (id_persona)
REFERENCES usuario (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuario_comentarios_fk
FOREIGN KEY (id_persona)
REFERENCES usuario (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuario_favoritos_fk
FOREIGN KEY (id_persona)
REFERENCES usuario (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuario_comentarios_fk1
FOREIGN KEY (usuario_id_persona)
REFERENCES usuario (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT comentarios_fotos_fk
FOREIGN KEY (id_comentarios, id_lugares)
REFERENCES comentarios (id_comentarios, id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (id_recomentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT comentarios_fotos_fk1
FOREIGN KEY (id_comentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

create database PET_SHOP;

use PET_SHOP;

create table tb_consulta (
	cd_consulta INT (10) NOT NULL, /* CHAVE PRIMARIA */
    dt_consulta DATE NOT NULL,
    ds_consulta VARCHAR(45) NOT NULL,
    cd_cliente VARCHAR(50) NOT NULL, /* CHAVE ESTRANGEIRA */
    cd_pet int (10) NOT NULL,  /* CHAVE ESTRANGEIRA */
    cd_clinica int (10) NOT NULL, /* CHAVE ESTRANGEIRA */
	PRIMARY KEY (cd_consulta),
    constraint fk_cliente foreign key (cd_cliente) references cd_cliente(tb_cliente),
    constraint fk_pet foreign key (cd_pet) references cd_pet(tb_pet),
    constraint fk_clinica foreign key (cd_clinica) references cd_clinica(tb_esp_clinica)
);

create table tb_usuario (
	cd_usuario int (10) NOT NULL, /* CHAVE PRIMARIA */
    nm_usuario int (50) NOT NULL,
    email_usuario varchar(50) NOT NULL,
    senha_usuario varchar(50) NOT NULL,
    cd_tipoUsuario INT (1) NOT NULL,
    cd_contato INT (9) NOT NULL, /* CHAVE ESTRANGEIRA */
    PRIMARY KEY (cd_usuario),
    constraint fk_contato foreign key (cd_contato) references cd_contato(tb_contato)
);

create table tb_cliente (
	cd_cliente int (10) NOT NULL, /* CHAVE PRIMARIA */
    email_usuario varchar(50) NOT NULL, /* CHAVE ESTRANGEIRA */
    senha_usuario varchar(50) NOT NULL, /* CHAVE ESTRANGEIRA */
    cd_tipoUsuario INT (1) NOT NULL, /* CHAVE ESTRANGEIRA */
    cd_contato INT (9) NOT NULL, /* CHAVE ESTRANGEIRA */
    PRIMARY KEY (cd_cliente),
	constraint fk_email_usuario foreign key (email_usuario) references email_usuario(tb_usuario),
    constraint fk_senha_usuario foreign key (senha_usuario) references senha_usuario(tb_usuario),
    constraint fk_tipo_usuario foreign key (cd_tipoUsuario) references cd_tipoUsuario(tb_usuario),
    constraint fk_contato foreign key (cd_contato) references cd_contato(tb_contato)
);

create table tb_pet (
	cd_pet int (10) NOT NULL, /* CHAVE PRIMARIA */
    nome_pet varchar (50) NOT NULL,
    cd_esp_gato varchar (50), /* CHAVE ESTRANGEIRA */
    cd_esp_cachorro varchar (50), /* CHAVE ESTRANGEIRA */
    PRIMARY KEY (cd_pet),
    constraint fk_esp_gato foreign key (cd_esp_gato) references cd_esp_gato(tb_esp_gato),
    constraint fk_esp_cachorro foreign key (cd_esp_cachorro) references cd_esp_cachorro(tb_esp_cachorro)
);

create table tb_esp_gato (
	cd_esp_gato varchar (50) NOT NULL, /* CHAVE PRIMARIA */
    nm_esp_gato varchar (50) NOT NULL
);

create table tb_esp_cachorro (
	cd_esp_cachorro varchar (50) NOT NULL, /* CHAVE PRIMARIA */
    nm_esp_cachorro varchar (50) NOT NULL
    
);

create table tb_uf (
	cd_estado varchar (50) NOT NULL, /* CHAVE PRIMARIA */
    nm_estado varchar (50) NOT NULL
);

create table tb_cidade (
	cd_cidade varchar (50) NOT NULL, /* CHAVE PRIMARIA */
    nm_cidade varchar (50) NOT NULL,
    cd_estado varchar (50) NOT NULL, /* CHAVE ESTRANGEIRA */
    PRIMARY KEY (cd_cidade),
    constraint fk_cd_estado foreign key (cd_estado) references cd_estado(tb_uf)
);

create table tb_bairro (
	cd_bairro varchar (50) NOT NULL, /* CHAVE PRIMARIA */
    nm_bairro varchar (50) NOT NULL
);

create table tb_contato (
	cd_contato int (10) NOT NULL, /* CHAVE PRIMARIA */
	tel_cliente int (9) NOT NULL,
    email_cliente varchar (50) NOT NULL
);

create table tb_esp_clinica (
	cd_clinica int (10) NOT NULL, /* CHAVE PRIMARIA */
    especialidade varchar (50) NOT NULL
)


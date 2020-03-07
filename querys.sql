/*
 * Criação da tabela usuário
*/
CREATE TABLE user (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	login TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

/*
 * Criação da tabela cliente
*/
CREATE TABLE client (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	phone TEXT,
	email TEXT,
	address TEXT,
	observations TEXT
);

/*
 * Criação da tabela serviço
*/
CREATE TABLE service (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	description TEXT,
	total_cost REAL,
	price REAL
);

/*
 * Criação da tabela movimentação
*/
CREATE TABLE register (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	created_at DATE NOT NULL,
	service_date DATE,
	hour_service HOUR,
	description TEXT,
	done BLOB,
	amount_paid INTEGER,
	client int,
	FOREIGN KEY(client) REFERENCES client(id)
);

CREATE TABLE register_services (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	register int,
	service int,
	FOREIGN KEY(register) REFERENCES register(id),
	FOREIGN KEY(service) REFERENCES service(id)
);


/*
 * Querys para gerenciamento de usuários
*/

-- Seleciona usuário pelo id
select * from $USER_TABLE where id = $id;

-- Seleciona usuário por username
select * from $USER_TABLE where login like "$username";

-- Verifica se um usuário está cadastrado, com base no username e password
select * from $USER_TABLE where login like "$login" and password like "$password";


/*
 * Querys para gerenciamento de clientes
*/

-- Selecionar todos os clientes vinulados a um usuário
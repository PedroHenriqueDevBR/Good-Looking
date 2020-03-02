/*
 * Criação da tabela usuário
*/
CREATE TABLE "user" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	TEXT NOT NULL,
	"login"	TEXT NOT NULL UNIQUE,
	"password"	TEXT NOT NULL,
);

/*
 * Criação da tabela cliente
*/
CREATE TABLE "client" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	TEXT NOT NULL,
	"phone"	TEXT,
	"email"	TEXT,
	"address"	TEXT,
	"observations"	TEXT
);

/*
 * Criação da tabela serviço
*/
CREATE TABLE "service" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"total_cost"	REAL,
	"price"	REAL
);

/*
 * Criação da tabela movimentação
*/
CREATE TABLE "register" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"created_at"	DATE NOT NULL,
	"service_date"	DATE,
	"hour_service"	HOUR,
	"description"	TEXT,
	"done"	BLOB,
	"amount_paid"	INTEGER
);

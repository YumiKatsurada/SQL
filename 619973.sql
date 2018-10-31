CREATE TABLE IF NOT EXISTS cuidadorNprofissional(
	CPF VARCHAR(20) NOT NULL,
  	parentesco VARCHAR(20) NOT NULL,
  	CONSTRAINT FK_cpfCuidNprof FOREIGN KEY (CPF) REFERENCES pessoa(CPF),
  	CONSTRAINT PF_cpfCuidNprof PRIMARY KEY (CPF)
);

CREATE TABLE IF NOT EXISTS funcionario(
	CPF VARCHAR(20) NOT NULL, 
	IdFunc INT UNIQUE NOT NULL,	
	funcao VARCHAR(20),
	status VARCHAR(20),
	inicio DATE,
	especialidade VARCHAR(20), 
	horastrabalhadas INT,
	salario REAL,
  	CONSTRAINT FK_cpfFunc FOREIGN KEY (CPF) REFERENCES pessoa(CPF),
	CONSTRAINT PK_func PRIMARY KEY (CPF, IDFunc)
);

insert into localidade (IDlocal, rua, numero, complemento, CEP, cidade, estado) values (49498, 'Rua Dona Alexandrina', 270, 'casa', 13987360, 'São Carlos', 'SP');
insert into domicilio (IDlocal, numeroDeResidentes) values (49498, 4);
insert into pessoa (CPF, prenome, segnome, datanascimento, comunicador1, comunicador2, email1, email2, IDlocal) values 
(23514137845, 'Claudia', 'Lima', '1990-02-28', '(16) 99405-4569', null, 'claudia.lima@gmail.com', null, 49498);
insert into cuidadorNprofissional (CPF, parentesco)
values (23514137845, 'Vizinho');
insert into  funcionario (CPF, IdFunc, funcao, status, inicio, especialidade, horastrabalhadas, salario)
values (23514137845, 58, 'Médico', 'Ativo', '2010-05-23', 'Cardiologia', 160, 3500.0);

CREATE VIEW dadosCuidadoresNProf as select cuidadorNprofissional.CPF, prenome, segnome from pessoa INNER JOIN cuidadorNprofissional ON pessoa.CPF = cuidadorNprofissional.CPF;
CREATE VIEW dadosFuncionario as select funcionario.CPF, prenome, segnome, funcao, especialidade from funcionario INNER JOIN pessoa ON pessoa.CPF = funcionario.CPF order by prenome;

CREATE FUNCTION mediaHorasAnuaisFuncionario (horas INT, data DATE) returns INT 
	return horas/(YEAR(curdate()) - YEAR(data));
	
		


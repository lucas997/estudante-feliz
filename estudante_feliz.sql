DROP DATABASE IF EXISTS estudante_feliz;
CREATE DATABASE estudante_feliz;
use estudante_feliz;

CREATE TABLE responsavel (
nome_completo varchar(100) not null,
cpf varchar(11) not null primary key,
email varchar(100) not null,
rua varchar(100) not null,
senha varchar(20) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
uf varchar(2) not null
);

CREATE TABLE telefone_responsavel (
telefone varchar(10) not null,
cpf varchar(11) not null,
foreign key (cpf) references responsavel (cpf) on delete cascade on update cascade,
primary key(telefone)
);

CREATE TABLE aluno (
nome_completo varchar(100) not null,
matricula varchar(8) not null,
dt_nascimento date not null,
sexo char(1) not null,
rua varchar(100) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
tipo_deficiencia varchar(80),
primary key(matricula)
);


CREATE TABLE creche (
nome varchar(100) not null,
razao_social varchar(200) not null,
cnpj varchar(14) not null,
status varchar(11) not null,
telefone varchar(10) not null,
rua varchar(100) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
uf varchar(2) not null,
matricula varchar(8) not null,
primary key (cnpj),
constraint fk_aluno_creche foreign key (matricula) references aluno(matricula) on delete cascade on update cascade
);

CREATE TABLE funcionario (
nome varchar(100) not null,
codigo_funcionario varchar(100) not null,
senha varchar (20) not null, 
cargo varchar(50) not null,
cnpj varchar(14) not null,
primary key (codigo_funcionario),
constraint fk_creche_funcionario foreign key (cnpj) references creche (cnpj) on delete cascade on update cascade
);

CREATE TABLE responsavel_funcionario (
cpf varchar(11) not null,
codigo_funcionario varchar(4) not null,
constraint fk_responsavel_responsavel_funcionario foreign key (cpf) references responsavel(cpf) on delete cascade on update cascade,
constraint fk_funcionario_responsavel_funcionario foreign key (codigo_funcionario) references funcionario(codigo_funcionario) on delete cascade on update cascade,
constraint pk_responsavel_funcionario primary key (cpf,codigo_funcionario)
);

CREATE TABLE responsavel_creche (
cpf varchar(11) not null,
cnpj varchar(14) not null,
primary key (cpf,cnpj),
constraint fk_responsavel_responsavel_creche foreign key (cpf) references responsavel(cpf) on delete cascade on update cascade,
constraint fk_creche_responsavel_creche foreign key (cnpj) references creche(cnpj) on delete cascade on update cascade
);

/* Adicionando valores na tabela responsavel */


INSERT INTO responsavel (nome_completo, cpf, email, rua, senha, bairro, cidade, uf) VALUES ('Isaac Martins Pereira', '87651245679', 'isaacmp-89@gmail.com', 'Rua Alba Valdes nº 87', 'Qwo.o9090', 'Timbi', 'Camaragibe', 'PE');

INSERT INTO responsavel (nome_completo, cpf, email, rua, senha, bairro, cidade, uf) VALUES ('Michele Rodrigues de Souza', '07891719281', 'michele_souza@hotmail.com', 'Rua da Paz nº 115', 'Po_90901267','Afogados', 'Recife', 'PE');

INSERT INTO responsavel (nome_completo, cpf, email, rua, senha, bairro, cidade, uf) VALUES ('Amanda Gonçalves Oliveira', '08198146732', 'amandago95@gmail.com', 'Rua Padre Lemos nº 28', '1230_wwsd','Casa Amarela', 'Recife', 'PE');

INSERT INTO responsavel (nome_completo, cpf, email, rua, senha, bairro, cidade, uf) VALUES ('Felipe Queiroz Mattos', '91627912781', 'felipe_queiroz05@gmail.com', 'Rua do Imperador nº 22', '9099@12zsdf','Dois Irmãos', 'Recife', 'PE');

INSERT INTO responsavel (nome_completo, cpf, email, rua, senha, bairro, cidade, uf) VALUES ('Diego Augusto Sabino Moreira', '85671439832', 'diegoasm@gmail.com', 'Rua Paraná nº 43', 'kgyz-78aswloren18','Jardim Brasil', 'Olinda', 'PE');




/* inserindo valores na tabela telefone_responsavel */

INSERT INTO telefone_responsavel (telefone, cpf) VALUES ( '99869-2149', '87651245679');
INSERT INTO telefone_responsavel (telefone, cpf) VALUES ( '98341-0592', '07891719281');
INSERT INTO telefone_responsavel (telefone, cpf) VALUES ( '99914-7234', '08198146732');
INSERT INTO telefone_responsavel (telefone, cpf) VALUES ( '98674-1327', '91627912781');
INSERT INTO telefone_responsavel (telefone, cpf) VALUES ( '98865-4084', '85671439832');

/* inserindo valores na tabela aluno */

INSERT INTO aluno (nome_completo, matricula, dt_nascimento, sexo, rua, bairro, cidade, tipo_deficiencia) VALUES ('Maria Eduarda Silva Oliveira', '01243810', '2017-05-23', 'F', 'Rua Alba Valdes nº 87', 'Timbi', 'Camaragibe', 'Deficiência Visual');

INSERT INTO aluno (nome_completo, matricula, dt_nascimento, sexo, rua, bairro, cidade, tipo_deficiencia) VALUES ('João Vitor Rodrigues de Souza', '15544950', '2018-11-01', 'M', 'Rua da Paz nº 115', 'Afogados', 'Recife', 'Deficiência Auditiva');

INSERT INTO aluno (nome_completo, matricula, dt_nascimento, sexo, rua, bairro, cidade, tipo_deficiencia) VALUES ('Isabela Dias Gonçalves de Oliveira', '14037766', '2016-01-25', 'F', 'Rua Padre Lemos nº 28', 'Casa Amarela', 'Recife', null);

INSERT INTO aluno (nome_completo, matricula, dt_nascimento, sexo, rua, bairro, cidade, tipo_deficiencia) VALUES ('Matheus Henrique de Queiroz Matos', '13812493', '2016-12-25', 'M', 'Rua do Imperador nº 22', 'Dois Irmãos', 'Recife', null);

INSERT INTO aluno (nome_completo, matricula, dt_nascimento, sexo, rua, bairro, cidade, tipo_deficiencia) VALUES ('Luciana Peixoto Sabino Moreira', '01272130', '2018-02-02', 'F', 'Rua Paraná nº 43', 'Jardim Brasil', 'Olinda', null);

/* inserindo valores na tabela creche */

INSERT INTO creche (nome, razao_social, cnpj, status, telefone, rua, bairro, cidade, uf, matricula) VALUES ('Creche Recife 2000', 'Creche Municipal Recife 2000', '26153130186501', 'Disponível','3355-3776', 'Rua Rio Solimões', 'Areias', 'Recife', 'PE', '01243810');

INSERT INTO creche (nome, razao_social, cnpj, status, telefone, rua, bairro, cidade, uf, matricula) VALUES ('Creche Esperança', 'Creche Municipal Esperança', '26170736986545', 'Cheia','3232-7527', 'Rua Leila Félix Karan', 'San Martin', 'Recife', 'PE', '15544950');

INSERT INTO creche (nome, razao_social, cnpj, status, telefone, rua, bairro, cidade, uf, matricula) VALUES ('Creche Lar da Criança', 'Creche Municipal Lar da Criança', '20836508000131', 'Disponível','8645-0116', 'Rua Um nº 100', 'Charnequinha', 'Cabo de Santo Agostinho', 'PE', '14037766');

INSERT INTO creche (nome, razao_social, cnpj, status, telefone, rua, bairro, cidade, uf, matricula) VALUES ('Creche Maria Alice Guerra', 'Creche Municipal Maria Alice Gonçalves Guerra', '21503000696787', 'Disponível','3027-1474', 'Avenida Josadack Alves de França', 'Santa Mônica', 'Camaragibe', 'PE', '13812493');

INSERT INTO creche (nome, razao_social, cnpj, status, telefone, rua, bairro, cidade, uf, matricula) VALUES ('Creche Menino Jesus de Casa Forte', 'Creche Beneficente Menino Jesus de Casa Forte', '30149307000121', 'Cheia','3268-1025', 'Rua Samuel de Farias', 'Casa Forte', 'Recife', 'PE', '01272130');

/* inserindo valores na tabela funcionario */

INSERT INTO funcionario (nome, codigo_funcionario, senha, cargo, cnpj) VALUES ('Fátima Pereira Gomes', '1', 'azyxs@1267878','Diretora', '26153130186501');

INSERT INTO funcionario (nome, codigo_funcionario, senha, cargo, cnpj) VALUES ('Carla Fernanda Monteiro', '2', 'oquwt**qw8900', 'Professora', '26170736986545');

INSERT INTO funcionario (nome, codigo_funcionario, senha, cargo, cnpj) VALUES ('Elias Muniz Bezerra da Silva', '3', 'CDxnx@b34123', 'Secretário', '20836508000131');

INSERT INTO funcionario (nome, codigo_funcionario, senha, cargo, cnpj) VALUES ('Allysson Breno Ferreira', '4', 'mnzx_4509**', 'Porteiro', '21503000696787');

INSERT INTO funcionario (nome, codigo_funcionario, senha, cargo, cnpj) VALUES ('Patrícia Silveira Cordeiro', '5', 'aqer_@M1234','Monitora', '30149307000121');

/* inserindo valores na tabela responsavel_funcionario */

INSERT INTO responsavel_funcionario (cpf, codigo_funcionario) VALUES ('87651245679', '1');
INSERT INTO responsavel_funcionario (cpf, codigo_funcionario) VALUES ('07891719281', '2');
INSERT INTO responsavel_funcionario (cpf, codigo_funcionario) VALUES ('08198146732', '3');
INSERT INTO responsavel_funcionario (cpf, codigo_funcionario) VALUES ('91627912781', '4');
INSERT INTO responsavel_funcionario (cpf, codigo_funcionario) VALUES ('85671439832', '5');

/* inserindo valores na tabela responsavel_creche */

INSERT INTO responsavel_creche (cpf, cnpj) VALUES ('87651245679', '26153130186501');
INSERT INTO responsavel_creche (cpf, cnpj) VALUES ('07891719281', '26170736986545');
INSERT INTO responsavel_creche (cpf, cnpj) VALUES ('08198146732', '20836508000131');
INSERT INTO responsavel_creche (cpf, cnpj) VALUES ('91627912781', '21503000696787');
INSERT INTO responsavel_creche (cpf, cnpj) VALUES ('85671439832', '30149307000121');

/* Relatórios */

/* 1- Listar os nomes de todos os funcinoários e de seus responsáveis. */
SELECT fun.nome AS nome_funcionario, res.nome_completo
FROM funcionario fun, responsavel_funcionario fre, responsavel res 
WHERE fun.codigo_funcionario = fre.codigo_funcionario 
AND res.cpf = fre.cpf;

/*2- Listar o nome, razão social e o nome do resposável das creches do município de Recife. */
SELECT cre.nome AS nome_creche, cre.razao_social, res.nome_completo AS nome_responsavel
FROM responsavel res, responsavel_creche rec, creche cre 
WHERE res.cpf = rec.cpf 
AND cre.cnpj = rec.cnpj;

/* 3- Listar nome completo, data de nascimento e matricula dos alunos sem deficiência. */
SELECT alu.nome_completo AS nome_aluno, alu.dt_nascimento, alu.matricula 
FROM aluno alu
WHERE alu.tipo_deficiencia IS NULL;

/*4- Apresentar a quantidde de funcionarios por creche. */
SELECT cre.cnpj, cre.nome, COUNT(fun.nome) AS quantidade_funcionario 
FROM creche cre, funcionario fun
WHERE cre.cnpj = fun.cnpj group by cre.cnpj;

/*5- Informar a quantidade de alunos com deficiciência, por creche. */

SELECT cre.cnpj, cre.nome, COUNT(nome_completo) AS quantidade_com_deficiencia 
FROM aluno alu left join creche cre 
ON cre.matricula = alu.matricula WHERE alu.tipo_deficiencia IS NOT NULL 
GROUP BY cre.cnpj;
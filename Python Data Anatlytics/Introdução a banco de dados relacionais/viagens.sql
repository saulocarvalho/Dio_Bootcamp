CREATE DATABASE viagens;
#drop database viagens;
use viagens;
show tables;
create table usuarios(
id int,
nome varchar(255) not null comment 'Nome do usuário',
email varchar(100) not null unique,
endereco varchar(50) not null,
data_nascimento date not null
);

create table destinos(
id int,
nome varchar(255) not null unique,
descricao varchar(255)  not null
);

create table reservas(
id int,
id_usuario int,
id_destino int,
data_r date,
status varchar(255) default 'Pendente'
);

desc usuarios;
desc destinos;
desc reservas;
#Adicionando chave primária
alter table usuarios modify id int primary key auto_increment;
alter table usuarios auto_increment=1;

alter table destinos modify id int primary key auto_increment;
alter table destinos auto_increment=1;

alter table reservas modify id int primary key auto_increment;
alter table reservas auto_increment=1;

#Adicionando chave estrangeira
alter table reservas 
add constraint fk_reservas_usuarios
foreign key (id_usuario) references usuarios (id);

#Alterando colunas da tabela usuários
alter table usuarios 
add rua varchar(100),
add numero varchar(10),
add cidade varchar(50),
add estado varchar(20);

#Migrando dados da coluna anterior, para as novas colunas. Assim seperando ao novo local
update usuarios
set rua = substring_index (substring_index(endereco, ',', 1), ',', -1),
	numero = substring_index (substring_index(endereco, ',', 2), ',', -1),
    cidade = substring_index (substring_index(endereco, ',', 3), ',', -1),
    estado = substring_index(endereco, ',', -1);
    
#Deletando coluna endereco
alter table usuarios
drop endereco;


insert into usuarios (nome, email, data_nascimento, endereco)
	values ("saulo", "teste@teste.com", "2000-03-01", "Rua A, 123, Cidade X, Estado Y"),
		("carlos", "carlos@teste.com", "1995-03-01", "Rua B, 456, Cidade Y, Estado Z"),
		("pedro", "pedro@teste.com", "1994-03-01", "Rua C, 789, Cidade H, Estado I"),
		("paulo", "peste@teste.com", "1980-03-01", "Rua D, 454, Cidade K, Estado L");
		
insert into destinos (nome, descricao)
	values ('Praia do Rosa', 'Linda praia'),
   ('Ponta verde', 'Bela praia');    

insert into reservas (id_usuario, id_destino, data_r)
	values (4, 1, '2024-05-11'),
    (4, 2, '2024-06-20');
	
insert into usuarios (nome, email, data_nascimento, endereco)
	values ("saulo2", "teste3@teste.com", "2000-03-01", "Rua A, 123, Cidade X, Estado Y");

insert into reservas (id_usuario, id_destino, data_r)
	values (3, 1, '2024-04-11');
#inner join
select * from usuarios as u inner join reservas as r on u.id = id_usuario
inner join destinos as d on d.id = r.id_destino;

#left join
select * from usuarios as u left join reservas as r on u.id = id_usuario
order by r.id;

#right join 
select * from reservas as r right join destinos d on r.id_destino = d.id;

#sub consultas 
select * from destinos
where id not in (select id_destino from reservas);

select * from usuarios
where id not in (select id_usuario from reservas);

select usuarios.nome, (select count(*) from reservas where id_usuario = usuarios.id) as total_reservas 
from usuarios having total_reservas > 0; #inner join reservas where usuarios.id = reservas.id_usuario; #inner join reservas where usuarios.id = reservas.id_usuario;

select u.nome, d.nome from usuarios as u inner join reservas as r on u.id = r.id_usuario
inner join destinos as d on d.id = r.id_destino;
#Funções agregadas
select count(*) from usuarios as u inner join reservas as r
on u.id = r.id_usuario;

select max(timestampdiff(year, data_nascimento, current_date())) as Maior_Idade from usuarios;

#Agrupamento de resultados
insert into reservas(id_usuario, id_destino) values (1, 3);
select count(*), id_destino from reservas
group by id_destino; 

select count(*), id_destino from reservas
group by id_destino
order by count(*) desc; 

#Índices
INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E'),
('Laura Mendes', 'laura.mendes@example.com', '1994-09-12', 'Rua F'),
('Fernando Santos', 'fernando.santos@example.com', '1988-02-20', 'Rua G'),
('Mariana Costa', 'mariana.costa@example.com', '1997-11-30', 'Rua H'),
('Ricardo Rodrigues', 'ricardo.rodrigues@example.com', '1993-04-18', 'Rua I'),
('Camila Alves', 'camila.alves@example.com', '1989-08-08', 'Rua J'),
('Bruno Carvalho', 'bruno.carvalho@example.com', '1995-03-25', 'Rua K'),
('Amanda Silva', 'amanda.silva@example.com', '1996-12-02', 'Rua L'),
('Paulo Mendonça', 'paulo.mendonca@example.com', '1999-07-20', 'Rua M'),
('Larissa Oliveira', 'larissa.oliveira@example.com', '1987-10-15', 'Rua N'),
('Fernanda Sousa', 'fernanda.sousa@example.com', '1992-05-08', 'Rua O'),
('Gustavo Santos', 'gustavo.santos@example.com', '1993-09-18', 'Rua P'),
('Helena Costa', 'helena.costa@example.com', '1998-02-22', 'Rua Q'),
('Diego Almeida', 'diego.almeida@example.com', '1991-11-27', 'Rua R'),
('Juliana Lima', 'juliana.lima@example.com', '1997-04-05', 'Rua S'),
('Rafaela Silva', 'rafaela.silva@example.com', '1996-01-10', 'Rua T'),
('Lucas Pereira', 'lucas.pereira@example.com', '1986-08-30', 'Rua U'),
('Fábio Rodrigues', 'fabio.rodrigues@example.com', '1989-03-12', 'Rua V'),
('Isabela Santos', 'isabela.santos@example.com', '1994-12-07', 'Rua W'),
('André Alves', 'andre.alves@example.com', '1995-09-28', 'Rua X'),
('Clara Carvalho', 'clara.carvalho@example.com', '1990-02-15', 'Rua Y'),
('Roberto Mendes', 'roberto.mendes@example.com', '1992-07-21', 'Rua Z'),
('Mariana Oliveira', 'mariana.oliveira@example.com', '1997-05-03', 'Av. A'),
('Gustavo Costa', 'gustavo.costa@example.com', '1998-11-16', 'Av. B'),
('Lara Sousa', 'lara.sousa@example.com', '1993-06-09', 'Av. C'),
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');

explain 
	select * from usuarios where nome = "lara";
create index idx_nome on usuarios (nome);

EXPLAIN SELECT * FROM usuarios WHERE nome = "Maria";

EXPLAIN SELECT * FROM usuarios us
INNER JOIN reservas rs
ON us.id = rs.id_usuario
WHERE nome = "Maria";
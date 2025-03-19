create database bd_pedido_0301;

use bd_pedido_0301;

create table tb_cliente
(cd_cliente int not null primary key,
cliente char(50));

create table tb_vendedor
(cd_vendedor int not null primary key,
vendedor char(50));

create table tb_veiculo
(cd_veiculo int not null primary key,
veiculo char(50),
valor_pedido decimal(12,2));

create table tb_pedido
(nr_pedido int not null primary key,
dt_pedido date,
cd_veiculo int,
cd_cliente int,
cd_vendedor int,
valor_pedido decimal(12,2),
comissao decimal(12,2));

alter table tb_pedido
add constraint fk_cliente foreign key(cd_cliente)
references tb_cliente (cd_cliente);

alter table tb_pedido
add constraint fk_vendedor foreign key(cd_vendedor)
references tb_vendedor (cd_vendedor);

alter table tb_pedido
add constraint fk_veiculo foreign key(cd_veiculo)
references tb_veiculo (cd_veiculo);

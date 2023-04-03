insert into associado (nome, sobrenome, idade, email) values('Associado 1', 'Sobrenome', 30, 'associado1@email.com');
insert into associado (nome, sobrenome, idade, email) values('Associado 2', 'Sobrenome', 35, 'associado2@email.com');
insert into associado (nome, sobrenome, idade, email) values('Associado 3', 'Sobrenome', 40, 'associado2@email.com');

insert into conta (tipo, id_associado) values ('Conta Corrente', 1);
insert into conta (tipo, id_associado) values ('Conta Corrente', 2);
insert into conta (tipo, id_associado) values ('Conta Poupança', 3);

insert into cartao (num_cartao, nome_impresso, id_conta, id_associado)
			values (floor(random() * 100000 + 1)::int, 'Associado 1 Sobrenome', 1, 1);
insert into cartao (num_cartao, nome_impresso, id_conta, id_associado)
			values (floor(random() * 100000 + 1)::int, 'Associado 2 Sobrenome', 2, 2);
insert into cartao (num_cartao, nome_impresso, id_conta, id_associado)
			values (floor(random() * 1000000 + 1)::int, 'Associado 3 Sobrenome', 3, 3);

insert into movimento (vlr_transacao, des_transacao, id_cartao)
			values (floor(random() * 10000 + 1)::decimal(10,2), 'transferência', 1);
insert into movimento (vlr_transacao, des_transacao, id_cartao)
			values (floor(random() * 10000 + 1)::decimal(10,2), 'transferência', 2);
insert into movimento (vlr_transacao, des_transacao, id_cartao)
			values (floor(random() * 10000 + 1)::decimal(10,2), 'depósito', 3);
--exercicio 1--
create trigger After_Insert_Cliente 
	after insert on Clientes 
	for each row
begin 
	insert into Auditoria (mensagem, data_hora)
    values ('Novo cliente inserido', NOW() );
END;

--exercicio 2--
create trigger BeforeDeleteCliente
before delete
on Clientes for each row
begin
	insert into Auditoria (mensagem, data_hora)
    values ('Tentativa de exclusão do cliente ID:  ', OLD.cliente_id, NOW() );
end;

--exercicio 3--
create trigger AfterUpdateCliente 
after update of nome 
on Clientes for each row
begin
	insert into Auditoria (mensagem, data_hora)
    values ('Nome do cliente ID', NEW.cliente_id, 'atualizado de', OLD.nome, 'para', NEW.nome, NOW());
end;

--exercicio 4--
DELIMITER //
create trigger BeforeUpdateCliente
before update of nome
on Clientes for each row
begin
	insert into Auditoria (mensagem, data_hora)
    values ('Tentativade atualização inválida para cliente ID ', NEW.cliente_id, NOW());
end;
//
DELIMITER;

--exercicio 5--
DELIMITER //
create trigger BeforeUpdateCliente
before update of nome
on Clientes for each row
begin
	insert into Auditoria (mensagem, data_hora)
    values ('Tentativade atualização inválida para cliente ID ', NEW.cliente_id, NOW());
end;
//
DELIMITER;

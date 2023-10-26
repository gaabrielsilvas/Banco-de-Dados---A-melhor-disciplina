--exercicio 1--
create trigger After_Insert_Cliente 
	after insert on Clientes 
	for each row
begin 
	insert into Auditoria (mensagem, data_hora)
    values ('Novo cliente inserido', NOW() );
END;

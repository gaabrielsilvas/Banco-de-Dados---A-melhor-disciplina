--exercicio 1
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END;
//

--exercicio 2
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome FROM Livro INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID WHERE Categoria.Nome = categoriaNome;
END;
//

--exercicio 3
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoriaNome VARCHAR(100), OUT totalLivros INT)
BEGIN SELECT COUNT(*) INTO totalLivros FROM Livro INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID WHERE Categoria.Nome = categoriaNome;
END;
//

--exercicio 4
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100), OUT categoriaPossuiLivros BOOLEAN)
BEGIN DECLARE totalLivros INT;
    
    SELECT COUNT(*) INTO totalLivros FROM Livro INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID WHERE Categoria.Nome = categoriaNome;
    
    IF totalLivros > 0 THEN
        SET categoriaPossuiLivros = TRUE;
    ELSE
        SET categoriaPossuiLivros = FALSE;
    END IF;
END;
//

--exercicio 5
CREATE PROCEDURE sp_LivrosAteAno(IN anoPublicacao INT)
BEGIN SELECT Livro.Titulo, Livro.Ano_Publicacao, Autor.Nome, Autor.Sobrenome FROM Livro INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID WHERE Livro.Ano_Publicacao <= anoPublicacao;
END;

//

--exercicio 6
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN SELECT Livro.Titulo FROM Livro INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID WHERE Categoria.Nome = categoriaNome;
END;

//


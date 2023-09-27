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

--exercicio 7

CREATE PROCEDURE sp_AdicionarLivro(
    IN tituloLivro VARCHAR(255),
    IN editoraID INT,
    IN anoPublicacao INT,
    IN numeroPaginas INT,
    IN categoriaID INT,
    OUT livroID INT,
    OUT erro VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET erro = 'Erro ao adicionar o livro. Verifique os dados e tente novamente.';
    END;
    
    START TRANSACTION;
    
    -- Verifica se o título do livro já existe.
    SELECT Livro_ID INTO livroID
    FROM Livro
    WHERE Titulo = tituloLivro;
    
    IF livroID IS NOT NULL THEN
        ROLLBACK;
        SET erro = 'Um livro com o mesmo título já existe na biblioteca.';
    ELSE
        -- Inserir o novo livro.
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (tituloLivro, editoraID, anoPublicacao, numeroPaginas, categoriaID);
        
        COMMIT;
        SET erro = '';
    END IF;
END;

//

-- exercicio 8
CREATE PROCEDURE sp_AutorMaisAntigo(OUT nomeAutorMaisAntigo VARCHAR(255))
BEGIN
    SELECT CONCAT(Nome, ' ', Sobrenome)
    INTO nomeAutorMaisAntigo
    FROM Autor
    WHERE Data_Nascimento = (SELECT MIN(Data_Nascimento) FROM Autor);
END;

//

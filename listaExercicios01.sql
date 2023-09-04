SELECT titulo FROM livros;

SELECT nome FROM autores WHERE YEAR(nascimento) < 1900;

SELECT livros.titulo FROM livros INNER JOIN autores ON livros.autor_id = autores.id WHERE autores.nome = 'J.K. Rowling';

SELECT alunos.nome FROM alunos INNER JOIN matriculas ON alunos.id = matriculas.aluno_id WHERE matriculas.curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto;

SELECT autores.nome AS autor, COUNT(livros.id) AS numero_de_livros FROM autores LEFT JOIN livros ON autores.id = livros.autor_id GROUP BY autores.nome;

SELECT curso, COUNT(aluno_id) AS total_alunos FROM matriculas GROUP BY curso;

SELECT produto, AVG(receita) AS media_receita FROM vendas GROUP BY produto;

SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto HAVING SUM(receita) > 10000.00;

SELECT autores.nome AS autor, COUNT(livros.id) AS numero_de_livros FROM autores LEFT JOIN livros ON autores.id = livros.autor_id GROUP BY autores.nome HAVING COUNT(livros.id) > 2;

SELECT livros.titulo AS livro, autores.nome AS autor FROM livros INNER JOIN autores ON livros.autor_id = autores.id;

SELECT alunos.nome AS aluno, matriculas.curso FROM alunos LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

SELECT autores.nome AS autor, COALESCE(livros.titulo, 'Nenhum livro publicado') AS livro FROM autores LEFT JOIN livros ON autores.id = livros.autor_id;

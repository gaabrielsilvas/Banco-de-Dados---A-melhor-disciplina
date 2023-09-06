-- Exer. 1
SELECT titulo FROM livros;

-- Exer. 2
SELECT nome FROM autores WHERE YEAR(nascimento) < 1900;

-- Exer. 3
SELECT livros.titulo FROM livros INNER JOIN autores ON livros.autor_id = autores.id WHERE autores.nome = 'J.K. Rowling';

-- Exer. 4
SELECT alunos.nome FROM alunos INNER JOIN matriculas ON alunos.id = matriculas.aluno_id WHERE matriculas.curso = 'Engenharia de Software';

-- Exer. 5
SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto;

-- Exer. 6
SELECT autores.nome AS autor, COUNT(livros.id) AS numero_de_livros FROM autores LEFT JOIN livros ON autores.id = livros.autor_id GROUP BY autores.nome;

-- Exer. 7
SELECT curso, COUNT(aluno_id) AS total_alunos FROM matriculas GROUP BY curso;

-- Exer. 8
SELECT produto, AVG(receita) AS media_receita FROM vendas GROUP BY produto;

-- Exer. 9
SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto HAVING SUM(receita) > 10000.00;

-- Exer. 10
SELECT autores.nome AS autor, COUNT(livros.id) AS numero_de_livros FROM autores LEFT JOIN livros ON autores.id = livros.autor_id GROUP BY autores.nome HAVING COUNT(livros.id) > 2;

-- Exer. 11
SELECT livros.titulo AS livro, autores.nome AS autor FROM livros INNER JOIN autores ON livros.autor_id = autores.id;

-- Exer. 12
SELECT alunos.nome AS aluno, matriculas.curso FROM alunos LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- Exer. 13
SELECT autores.nome AS autor, COALESCE(livros.titulo, 'Nenhum livro publicado') AS livro FROM autores LEFT JOIN livros ON autores.id = livros.autor_id;

-- Exer. 14
SELECT matriculas.curso, alunos.nome AS aluno FROM matriculas RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;

-- Exer. 15
SELECT alunos.nome AS aluno, matriculas.curso FROM alunos INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;

-- Exer. 16
SELECT autores.nome AS autor, COUNT(livros.id) AS numero_de_livros FROM autores LEFT JOIN livros ON autores.id = livros.autor_id GROUP BY autores.nome ORDER BY numero_de_livros DESC LIMIT 1;

-- Exer. 17
SELECT produto FROM vendas WHERE receita = (SELECT MIN(receita) FROM vendas);

-- Exer. 19
SELECT alunos.nome AS aluno, COUNT(matriculas.id) AS numero_de_matriculas FROM alunos LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id GROUP BY alunos.nome;

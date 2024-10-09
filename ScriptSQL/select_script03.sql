--(a)
SELECT p.*, pf.cpf 
FROM Pessoa p
INNER JOIN PessoaFisica pf ON p.idPessoa = pf.Pessoa_idPessoa;

--(b)
SELECT p.*, pj.cnpj 
FROM Pessoa p
INNER JOIN PessoaJuridica pj ON p.idPessoa = pj.Pessoa_idPessoa;

--(c)
SELECT m.*, p.nome as fornecedor, pr.nome as Produto, m.quantidade, m.valorUnitario, (m.quantidade * m.valorUnitario) as total
FROM Movimento m
INNER JOIN Pessoa p ON p.idPessoa = m.Pessoa_idPessoa
INNER JOIN Produto pr ON pr.idProduto = m.Produto_idProduto
WHERE m.tipo = 'E';

--(d)
SELECT m.*, p.nome as comprador, pr.nome as Produto, m.quantidade, m.valorUnitario, (m.quantidade * m.valorUnitario) as total
FROM Movimento m
INNER JOIN Pessoa p ON m.Pessoa_idPessoa = p.idPessoa
INNER JOIN Produto pr ON m.Produto_idProduto = pr.idProduto
WHERE m.tipo = 'S';

--(e)
SELECT pr.nome, SUM(m.quantidade * m.valorUnitario) as valor_total
FROM Movimento m
INNER JOIN Produto pr ON m.Produto_idProduto = pr.idProduto
WHERE m.tipo = 'E'
GROUP BY pr.nome;

--(f)
SELECT pr.nome, SUM(m.quantidade * m.valorUnitario) as valor_total
FROM Movimento m
INNER JOIN Produto pr ON m.Produto_idProduto = pr.idProduto
WHERE m.tipo = 'S'
GROUP BY pr.nome;

--(g)
SELECT u.*
FROM Usuario u
LEFT JOIN Movimento m ON u.idUsuario = m.Usuario_idUsuario AND m.tipo = 'E'
WHERE m.idMovimento IS NULL;

--(h)
SELECT u.nome, SUM(m.quantidade * m.valorUnitario) as valor_total
FROM Movimento m
INNER JOIN Usuario u ON m.Usuario_idUsuario = u.idUsuario
WHERE m.tipo = 'E'
GROUP BY u.nome;

--(i)
SELECT u.nome, SUM(m.quantidade * m.valorUnitario) as valor_total
FROM Movimento m
INNER JOIN Usuario u ON m.Usuario_idUsuario = u.idUsuario
WHERE m.tipo = 'S'
GROUP BY u.nome;

--(j)
SELECT pr.nome, SUM(m.quantidade * m.valorUnitario) / SUM(m.quantidade) as media
FROM Movimento m
INNER JOIN Produto pr ON m.Produto_idProduto = pr.IdProduto
WHERE m.tipo = 'S'
GROUP BY pr.nome;

select *from Pessoa;


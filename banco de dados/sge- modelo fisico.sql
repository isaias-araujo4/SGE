CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirEntradaProduto`(
    IN Quantidade_entrada INT,
    IN Fornecedor VARCHAR(25),
    IN Nota VARCHAR(25),
    IN OBS VARCHAR(50),
    IN Produto_ID INT,
    IN Funcionario_ID INT
)
BEGIN
    SET Fornecedor = IFNULL(Fornecedor, 'N/A');
    SET Nota = IFNULL(Nota, 'N/A');
    SET OBS = IFNULL(OBS, 'N/A');

    INSERT INTO entrada_produto (
        Data_entrada,
        Quantidade_entrada,
        Hora_entrada,
        Fornecedor,
        Nota,
        OBS,
        Produto_ID,
        Funcionario_ID
    ) VALUES (
        CURDATE(),
        Quantidade_entrada,
        CURTIME(),
        Fornecedor,
        Nota,
        OBS,
        Produto_ID,
        Funcionario_ID
    );

    -- Atualiza a quantidade total do produto na tabela 'produto'
    UPDATE produto
    SET Quantidade_total = Quantidade_total + Quantidade_entrada
    WHERE ID = Produto_ID;
END;

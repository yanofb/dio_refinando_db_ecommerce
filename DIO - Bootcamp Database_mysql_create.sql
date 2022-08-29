CREATE TABLE `Clientes` (
	`idCliente` INT NOT NULL AUTO_INCREMENT,
	`Nome` varchar(45),
	`E-mail` varchar(45),
	`Endereço` varchar(45),
	`Tipo Conta` BINARY(45),
	`CPF` INT(11),
	`CNPJ` INT(14),
	PRIMARY KEY (`idCliente`)
);

CREATE TABLE `Produto` (
	`idProduto` INT NOT NULL AUTO_INCREMENT,
	`Categoria` varchar(45),
	`Descrição` varchar(45),
	`Valor` FLOAT,
	PRIMARY KEY (`idProduto`)
);

CREATE TABLE `Fornecedor` (
	`idFornecedor` INT NOT NULL AUTO_INCREMENT,
	`Razão Social` varchar(45),
	`CNPJ` varchar(45) NOT NULL,
	PRIMARY KEY (`idFornecedor`)
);

CREATE TABLE `Pedido` (
	`idPedido` INT NOT NULL AUTO_INCREMENT,
	`Status` varchar(45),
	`Descrição` varchar(45),
	`Cliente_idCliente` INT NOT NULL,
	`Frete` FLOAT NOT NULL,
	PRIMARY KEY (`idPedido`)
);

CREATE TABLE `Disponibilizando produto` (
	`PD_idProduto` INT NOT NULL AUTO_INCREMENT,
	`Forn_idFornecedor` varchar(45) NOT NULL,
	`Descrição` varchar(45),
	`Valor` FLOAT
);

CREATE TABLE `Estoque` (
	`idEstoque` INT(45) NOT NULL AUTO_INCREMENT,
	`Local` varchar(45) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`idEstoque`)
);

CREATE TABLE `Produto_has_Estoque` (
	`PD_idProduto` INT NOT NULL AUTO_INCREMENT,
	`Estoque_idEstoque` INT NOT NULL AUTO_INCREMENT,
	`Quantidade` INT NOT NULL
);

CREATE TABLE `Produto/Pedido` (
	`PD_idProduto` INT NOT NULL AUTO_INCREMENT,
	`Pedido_idPedido` INT,
	`Quantidade` varchar(45)
);

CREATE TABLE `Terceiro - Vendedor` (
	`idTerceiro - Vendedor` INT NOT NULL AUTO_INCREMENT,
	`Identificação` varchar(45),
	`Endereço` varchar(45),
	PRIMARY KEY (`idTerceiro - Vendedor`)
);

CREATE TABLE `Produtos por Terceiros` (
	`Terceiro-Vendedor_idTerceiro - Vendedor` INT AUTO_INCREMENT,
	`PD_idProduto` INT,
	`Quantidade` varchar(45)
);

CREATE TABLE `Pagamento` (
	`Pedido_idPedido` INT,
	`Cliente_idCliente` INT AUTO_INCREMENT,
	`Status` varchar(45),
	`Tipo pagamento` varchar(45) NOT NULL,
	`Nome_Pagador` BINARY NOT NULL UNIQUE,
	`Numero_Cartao` varchar(16) UNIQUE,
	`Validade_Cartao` DATE(04) UNIQUE
);

CREATE TABLE `Entrega` (
	`PD_idProduto` INT NOT NULL,
	`Pedido_idPedido` INT NOT NULL AUTO_INCREMENT,
	`Forma_entrega` varchar(50) NOT NULL,
	`Status` varchar(45),
	`Código_rastreio` varchar(15) NOT NULL
);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Clientes`(`idCliente`);

ALTER TABLE `Disponibilizando produto` ADD CONSTRAINT `Disponibilizando produto_fk0` FOREIGN KEY (`PD_idProduto`) REFERENCES `Produto`(`idProduto`);

ALTER TABLE `Disponibilizando produto` ADD CONSTRAINT `Disponibilizando produto_fk1` FOREIGN KEY (`Forn_idFornecedor`) REFERENCES `Fornecedor`(`idFornecedor`);

ALTER TABLE `Produto_has_Estoque` ADD CONSTRAINT `Produto_has_Estoque_fk0` FOREIGN KEY (`PD_idProduto`) REFERENCES `Produto`(`idProduto`);

ALTER TABLE `Produto_has_Estoque` ADD CONSTRAINT `Produto_has_Estoque_fk1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `Estoque`(`idEstoque`);

ALTER TABLE `Produto/Pedido` ADD CONSTRAINT `Produto/Pedido_fk0` FOREIGN KEY (`PD_idProduto`) REFERENCES `Produto`(`idProduto`);

ALTER TABLE `Produto/Pedido` ADD CONSTRAINT `Produto/Pedido_fk1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido`(`Cliente_idCliente`);

ALTER TABLE `Produtos por Terceiros` ADD CONSTRAINT `Produtos por Terceiros_fk0` FOREIGN KEY (`Terceiro-Vendedor_idTerceiro - Vendedor`) REFERENCES `Terceiro - Vendedor`(`idTerceiro - Vendedor`);

ALTER TABLE `Produtos por Terceiros` ADD CONSTRAINT `Produtos por Terceiros_fk1` FOREIGN KEY (`PD_idProduto`) REFERENCES `Produto`(`idProduto`);

ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk0` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido`(`idPedido`);

ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Clientes`(`idCliente`);

ALTER TABLE `Entrega` ADD CONSTRAINT `Entrega_fk0` FOREIGN KEY (`PD_idProduto`) REFERENCES `Produto`(`idProduto`);

ALTER TABLE `Entrega` ADD CONSTRAINT `Entrega_fk1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido`(`idPedido`);














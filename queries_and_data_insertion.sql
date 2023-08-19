-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Mname, Lname, CPF, clientCEP, clientCountry, clientState, clientCity, clientStreetAndNumber, Birthdate, Gender, Email, Phone) 
	   values('Maria','M','Silva', 22475705665, 10931829,'Estados Unidos', 'Califórnia', 'Los Angeles', 'rua silva de prata 29, Carangola - Cidade das flores', '2023-08-15', 'F', 'fineuahgyh@email.com', '37458026867'),
		     ('Matheus','O','Pimentel', 83349188881, 45699132, 'Canadá', 'Ontário', 'Toronto', 'rua alemeda 289, Centro - Cidade das flores', '2018-09-19', 'M', 'whoufhcsgo@email.com', '57596472389'),
			 ('Ricardo','F','Silva', 23567426047, 33801741, 'Reino Unido', 'Inglaterra', 'Londres', 'avenida alemeda vinha 1009, Centro - Cidade das flores', '2023-05-04', 'M', 'iljqgzinil@email.com', '26567730847'),
			 ('Julia','S','França', 23567426042, 63723034, 'França', 'Paris', 'Île-de-France', 'rua lareijras 861, Centro - Cidade das flores', '2009-08-24', 'F', 'niwnbpcjjq@email.com', '90135093279'),
			 ('Roberta','G','Assis', 78159029040, 09681750, 'Alemanha', 'Berlim', 'Berlim', 'avenidade koller 19, Centro - Cidade das flores', '2020-07-23', 'F', 'mvphsaooxp@email.com', '19114922037'),
			 ('Isabela','M','Cruz', 49920769108, 41824210, 'Itália', 'Roma', 'Latium', 'rua alemeda das flores 28, Centro - Cidade das flores', '2008-05-14', 'F', 'qloltelvlw@email.com', '33497499303');

-- idProduct, Pname, classification_age enum, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_age, category, size, Price, deliveryTime) values
							  ('Fone de ouvido','4+','Eletrônico',null, 83.56, '2023-08-23'),
                              ('Barbie Elsa','4+','Brinquedos',null, 33.02, '2023-08-29'),
                              ('Body Carters','L','Vestimenta',null, 54.37, '2023-08-20'),
                              ('Microfone Vedo - Youtuber','L','Eletrônico',null, 80.14, '2023-08-28'),
                              ('Sofá retrátil','L','Móveis','3x57x80', 51.76, '2023-09-07'),
                              ('Farinha de arroz',null,'Alimentos',null, 53.29, '2023-08-26'),
                              ('Fire Stick Amazon','4+','Eletrônico',null, 14.2, '2023-08-27');

-- retorna os clientes
select * from clients;

-- retorna os produtos
select * from product;

-- delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOclient, orderStatus, orderDescription, shippingCost, orderDate) values (1, default,'compra via aplicativo',1,'2023-08-20'),
                (2, default,'compra via aplicativo',50.0,'2023-09-04'),
                (3, 'Enviando',null,1,'2023-09-06'),
                (4, default,'compra via web site',150.0,'2023-09-07');

-- select * from orders;
insert into productOrder (idPOproduct,idPOorder,poPrice,poQuantity,poStatus) values
						 (1,1,83.56,1,default),
                         (2,2,33.02,2,'Sem estoque'),
                         (3,3,54.37,3,default);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantityStorage) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName,CNPJ,contact,supplierCEP,supplierCountry,supplierState,supplierCity,supplierStreetAndNumber) values 
							('Almeida e filhos', 123456789123456,'21985474','04876315828','Estados Unidos', 'Califórnia', 'Los Angeles','rua silva de prata 29, Carangola - Cidade das flores'),
                            ('Eletrônicos Silva', 854519649143457,'21985484','91348030832','Canadá', 'Ontário', 'Toronto','rua alemeda 289, Centro - Cidade das flores'),
                            ('Eletrônicos Valma', 934567893934695,'21975474','55358475495','Reino Unido', 'Inglaterra', 'Londres','avenida alemeda vinha 1009, Centro - Cidade das flores');

-- retorna os fornecedores
select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, supQuantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName,AbstName,CNPJ,contact,sellerCEP,sellerCountry,sellerState,sellerCity,sellerStreetAndNumber) values 
						('Tech eletronics','Joy',123456789123456, 29896392278,46609244164,'Brazil','Rio de Janeiro','Rio de Janeiro','rua silva de prata 29, Carangola - Cidade das flores'),
					    ('Botique Durgas','Freedom',123456783135648,57822175163,96270642164,'Brazil','Rio de Janeiro','Rio de Janeiro', 'rua alemeda 289, Centro - Cidade das flores'),
						('Kids World','Love',456789123654485,82635206074,27886793164,'Brazil','São Paulo','São Paulo','avenida alemeda vinha 1009, Centro - Cidade das flores');

-- retorna os vendedores
select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idSproduct, prodSQuantity) values 
						 (1,6,80),
                         (2,7,10);

-- retorna id dos pordutos e do vendedor
select * from productSeller;

-- conta todos os clientes
select count(*) from clients;

-- retorna as informações do pedido através do id do cliente
select * from clients c, orders o where c.idClient = idOClient;

-- retorna as informações do pedido/cliente através do id do cliente
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOClient;

-- retorna as informações do nome do Cliente, idOrdem e Status do pedido através do id do cliente
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOClient;

-- insere cliente
insert into orders (idOclient, orderStatus, orderDescription, shippingCost, orderDate) values 
			(2, default,'compra via aplicativo',50.0,'2023-09-04');

-- Conta a quantidade de pedidos por cliente
select CONCAT(Fname, ' ', Lname) as Client, COUNT(o.idOclient) as Request, MAX(orderStatus) as Status from clients c
    inner join orders o on c.idClient = o.idOClient
    group by c.idClient, Client;

-- seleciona todas os pedidos
select * from orders;

-- recuperação de pedido com produto associado
select * from clients c
    join orders o ON c.idClient = o.idOclient
    join productOrder po ON o.idOrder = po.idPOorder
    where c.idClient = o.idOclient
    ORDER BY c.idClient, o.idOrder, po.idPOproduct;
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient;

-- Refinamento:

-- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
alter table clients add CNPJ char(15) not null;
alter table clients drop constraint unique_cpf_client;
alter table clients add constraint unique_key_client unique (CPF,CNPJ);
alter table clients add kindAccount enum('pf','pj') not null;

DELIMITER //

CREATE TRIGGER cpf_cnpj_validation
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
   IF NEW.kindAccount = 'pf' AND NEW.CNPJ IS NOT NULL THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Cannot insert CNPJ for an individual (PF) account';
   END IF;

   IF NEW.kindAccount = 'pj' AND NEW.CPF IS NOT NULL THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Cannot insert CPF for a legal entity (PJ) account';
   END IF;
END;
//

DELIMITER //

CREATE TRIGGER cpf_cnpj_validation_update
BEFORE UPDATE ON clients
FOR EACH ROW
BEGIN
   IF NEW.kindAccount = 'pf' AND NEW.CNPJ IS NOT NULL THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Cannot update CNPJ for an individual (PF) account';
   END IF;

   IF NEW.kindAccount = 'pj' AND NEW.CPF IS NOT NULL THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Cannot update CPF for a legal entity (PJ) account';
   END IF;
END;
//

DELIMITER ;


-- Teste(Obs.: fazer o teste após inserir dados do arquivo queries)

select * from clients;

update clients set CNPJ = '574449045510534' where idClient = 1;

-- Pagamento – Pode ter cadastrado mais de uma forma de pagamento
alter table payments add secondaryPayMethod enum('Boleto','Cartão','Dois cartões','Pix');

-- Entrega – Possui status e código de rastreio (criado anteriormente(parcial))
 --   orderStatus enum('Faturando', 'Em processamento', 'Enviando', 'Entregue') default 'Em processamento')

alter table orders add trackingCode varchar(22);

alter table storageLocation add trackingDelivery enum('Faturando', 'Em processamento', 'Enviando', 'Entregue');

alter table supplier add trackingSupDelivery enum('Faturando', 'Em processamento', 'Enviando', 'Entregue');

-- Quantos pedidos foram feitos por cada cliente?
--      Linha 107 do arquivo queries.

-- Algum vendedor também é fornecedor?
--      Linha 134 do arquivo queries.

-- Algum vendedor também é fornecedor?
select * from seller sel join supplier sup on sel.CNPJ = sup.CNPJ;

-- Relação de produtos fornecedores e estoques:
select * from product p join productSupplier ps on p.idProduct = ps.idPsProduct join supplier sup on ps.idPsSupplier = sup.idSupplier;

-- Relação de nomes dos fornecedores e nomes dos produtos:
select Pname, SocialName from product p join productSupplier ps on p.idProduct = ps.idPsProduct join supplier sup on ps.idPsSupplier = sup.idSupplier;

-- Complementos:
-- Insertions: (payments, invoicing, rating).
-- queries: ()

-- Insert payments..
insert into payments (idPayClient,typePayment,limitAvailable,paymentTicket,statusPayment,secondaryPayMethod) values
            (1,'Boleto',6489.46,default,'Pago',null),
            (2,'Dois cartões',689.47,default,default,null),
            (3,'Cartão',4359.47,default,default,'Pix'),
            (3,'Boleto',4359.47,default,'Cancelado','Pix');

-- update product storage quantity
DELIMITER //

CREATE TRIGGER update_storage_after_invoicing
AFTER INSERT ON invoicing
FOR EACH ROW
BEGIN
    -- Retrieve the invoiced product ID and quantity
    DECLARE productId INT;
    DECLARE invoicedQuantity INT;
    
    SELECT idFProduct, nfPrQuantity INTO productId, invoicedQuantity
    FROM invoicing
    WHERE idInvoicing = NEW.idInvoicing;
    
    -- Update the storage quantity for the invoiced product
    UPDATE productStorage
    SET quantityStorage = quantityStorage - invoicedQuantity
    WHERE idProdStorage = productId;
END;
//

DELIMITER ;

-- insert invoicing..
insert into invoicing (idFProduct,kindofNf,nfPrQuantity,nfPrPrice,nfPrTotal,sellerCPF,sellerCNPJ) values
            (1,'1',1,83.56,83.56,null,'123456789123456');

-- generate nf and send by email.

-- insert rating..
insert into rating (rating,ratDescription) values
            (3.8, 'Ótimo produto, porém passou do prazo de entrega.'),
            (5.0, 'Excelente produto, super Recomendo!!!');

-- Most popular product (can test better inserting more info in productOrder)
select p.idProduct, p.Pname, SUM(po.poQuantity) as totalOrdered from product p
    join productOrder po on p.idProduct = po.idPOproduct
    group by p.idProduct, p.Pname
    order by totalOrdered desc
    LIMIT 10; -- Adjust the limit as needed

-- Best-selling product by category:
select p.category, p.idProduct, p.Pname, SUM(po.poQuantity) as totalOrdered from product p
    join productOrder po on p.idProduct = po.idPOproduct
    group by p.category, p.idProduct, p.Pname
    order by totalOrdered desc;

-- Most profitable products
select p.idProduct, p.Pname, SUM(po.poQuantity) AS totalSoldQuantity, SUM(po.poPrice * po.poQuantity) as totalRevenue from product p
    join productOrder po on p.idProduct = po.idPOproduct
    group by p.idProduct, p.Pname
    order by totalRevenue DESC
    LIMIT 10; -- Adjust the limit as needed

-- Top 10 customers by number of orders:
select c.idClient, CONCAT(c.Fname, ' ', c.Lname) as customerName, COUNT(o.idOrder) as totalOrders from clients c
    join orders o on c.idClient = o.idOclient
    group by c.idClient, customerName
    order by totalOrders DESC
    LIMIT 10;

-- Average order value:
select AVG(orderTotal) as averageOrderValue from (
    select o.idOrder, SUM(po.poPrice * po.poQuantity) as orderTotal from orders o
        join productOrder po on o.idOrder = po.idPOorder
        group by o.idOrder
    ) AS orderTotals;

-- Revenue by month:
select YEAR(orderDate) as orderYear, MONTH(orderDate) as orderMonth, SUM(orderTotal) as totalRevenue from (
    select o.orderDate, SUM(po.poPrice * po.poQuantity) as orderTotal from orders o
        join productOrder po ON o.idOrder = po.idPOorder
        group by o.orderDate
    ) as orderTotals
    group by orderYear, orderMonth
    order by orderYear, orderMonth;

-- Products that have not been ordered in the past 6 months:
select p.idProduct, p.Pname from product p where
    not exists (select 1 from productOrder po
        join orders o on po.idPOorder = o.idOrder
        where po.idPOproduct = p.idProduct
            AND o.orderDate >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
    );

-- criação do banco de dados para o cenário de E-commerce 
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key not null,
    Fname varchar(10) not null,
    Mname varchar(10),
    Lname varchar(20) not null,
    CPF char(11),
    clientCEP varchar(15) not null,
    clientCountry varchar(20) not null,
    clientState varchar(20) not null,
    clientCity varchar(85) not null,
    clientStreetAndNumber varchar(103) not null,
    Birthdate Date not null,
    Gender char(3),
    Email varchar(25) unique not null,
    Phone varchar(18) unique not null,
    -- This ensures that each client has a unique CPF number.
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

create table rating(
    idRating int  auto_increment primary key not null,
    rating float default 0,
    ratDescription varchar(120)
);

alter table rating auto_increment=1;

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key not null,
    Pname varchar(45) not null,
    classification_age enum('L', '4+', '10+', '14+', '16+', '18+'),
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'),
    ratingProduct int,
    size varchar(10),
    Price float not null,
    deliveryTime Date,
    -- This ensures that each product has a unique name/id.(unique name because when i group by Pname i should know that i have different seller/supply(avoid false analyzes))
    constraint unique_product unique (idProduct,Pname),
    constraint fk_rating foreign key (ratingProduct) references rating(idRating)
);

alter table product auto_increment=1;

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key not null,
    idOclient int,
    orderStatus enum('Faturando', 'Em processamento', 'Enviando', 'Entregue') default 'Em processamento',
    orderDescription varchar(255),
    shippingCost float,
    orderDate Date,
    -- This ensures that each order is associated with a valid client.
    constraint fk_order_client foreign key (idOclient) references clients(idClient)
            on update cascade
);

alter table orders auto_increment=1;

create table payments(
    idPayment int auto_increment primary key not null,
	idPayClient int not null,
    typePayment enum('Boleto','Cartão','Dois cartões','Pix'),
    limitAvailable float,
    paymentTicket boolean default false,
    statusPayment enum('Pago', 'Aguardando', 'Cancelado') default 'Aguardando',
    constraint fk_pay_client foreign key (idPayClient) references orders(idOrder)
);

alter table payments auto_increment=1;

create table productOrder(
	idPOproduct int,
    idPOorder int,
    primary key (idPOproduct,idPOorder),
    poPrice float not null,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    -- This ensures that each product order is associated with a valid product.
    constraint fk_order_has_product foreign key (idPOproduct) references product(idProduct),
    -- This ensures that each product order is associated with a valid order.
    constraint fk_has_order foreign key (idPOorder) references orders(idOrder)
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key not null,
    storageLocation varchar(255),
    quantityStorage int
);

alter table productStorage auto_increment=1;

create table storageLocation(
	idLproduct int primary key not null,
    idLstorage int not null,
    location varchar(255) not null,
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key not null,
    SocialName varchar(255) unique not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    contact char(11) unique not null,
    sellerCEP varchar(15) not null,
    sellerCountry varchar(20) not null,
    sellerState varchar(25) not null,
    sellerCity varchar(85) not null,
    sellerStreetAndNumber varchar(103) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

create table invoicing(
    -- product/nf data
    -- 'Entry, exit or cancellation'.
    idInvoicing int auto_increment primary key,
    idFProduct int primary key,
    kindofNf enum('0','1','2') not null,
    nfPrQuantity int not null,
    nfPrPrice float not null,
    nfPrTotal float not null,
    sellerCPF char(9),
    sellerCNPJ char(15),
    -- order data
    constraint fk_nf_id_order_product foreign key (idFProduct) references orders(idOrder),
    -- seller data
    constraint fk_nf_cpf foreign key (sellerCPF) references seller(CPF),
    constraint fk_nf_cnpj foreign key (sellerCNPJ) references seller(CNPJ)
);

alter table invoicing auto_increment=1;
-- tabelas de relacionamentos M:N

create table productSeller(
	idPseller int,
    idSproduct int,
    prodSQuantity int default 1,
    primary key (idPseller, idSproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idSproduct) references product(idProduct)
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key not null,
    SocialName varchar(45) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    supplierCEP varchar(15) not null,
    supplierCountry varchar(20) not null,
    supplierState varchar(25) not null,
    supplierCity varchar(85) not null,
    supplierStreetAndNumber varchar(103) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    supQuantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

-- Relação de produtos fornecedores e estoques:
--      
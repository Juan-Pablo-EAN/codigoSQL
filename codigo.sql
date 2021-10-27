CREATE TABLE Articulo 
    (
     id INTEGER NOT NULL , 
     referencia VARCHAR (20) NOT NULL , 
     color VARCHAR (10) NOT NULL , 
     material VARCHAR (10) NOT NULL , 
     descripcion VARCHAR (30) NOT NULL , 
     precioUnitario INTEGER NOT NULL , 
     cantidad INTEGER NOT NULL , 
     Ventas_id INTEGER NOT NULL 
    )
GO

ALTER TABLE Articulo ADD CONSTRAINT Articulo_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Clientes 
    (
     id INTEGER NOT NULL , 
     nombre VARCHAR (20) NOT NULL , 
     identificador INTEGER NOT NULL , 
     estadoCliente BIT NOT NULL 
    )
GO

ALTER TABLE Clientes ADD CONSTRAINT Clientes_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ventas 
    (
     id INTEGER NOT NULL , 
     idCliente INTEGER NOT NULL , 
     idArticulo INTEGER NOT NULL , 
     fechaDeVenta DATE NOT NULL , 
     cantidad INTEGER NOT NULL , 
     total INTEGER NOT NULL , 
     Clientes_id INTEGER NOT NULL 
    )
GO

ALTER TABLE Ventas ADD CONSTRAINT Ventas_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Articulo 
    ADD CONSTRAINT Articulo_Ventas_FK FOREIGN KEY 
    ( 
     Ventas_id
    ) 
    REFERENCES Ventas 
    ( 
     id 
    ) 
    ON DELETE CASCADE 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ventas 
    ADD CONSTRAINT Ventas_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_id
    ) 
    REFERENCES Clientes 
    ( 
     id 
    ) 
    ON DELETE CASCADE 
    ON UPDATE NO ACTION 
GO

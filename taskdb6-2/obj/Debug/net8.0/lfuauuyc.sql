IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF SCHEMA_ID(N'production') IS NULL EXEC(N'CREATE SCHEMA [production];');
GO

IF SCHEMA_ID(N'sales') IS NULL EXEC(N'CREATE SCHEMA [sales];');
GO

CREATE TABLE [production].[brands] (
    [brand_id] int NOT NULL IDENTITY,
    [brand_name] varchar(255) NOT NULL,
    CONSTRAINT [PK__brands__5E5A8E27427DC594] PRIMARY KEY ([brand_id])
);
GO

CREATE TABLE [production].[categories] (
    [category_id] int NOT NULL IDENTITY,
    [category_name] varchar(255) NOT NULL,
    CONSTRAINT [PK__categori__D54EE9B41EEF0655] PRIMARY KEY ([category_id])
);
GO

CREATE TABLE [sales].[customers] (
    [customer_id] int NOT NULL IDENTITY,
    [first_name] varchar(255) NOT NULL,
    [last_name] varchar(255) NOT NULL,
    [phone] varchar(25) NULL,
    [email] varchar(255) NOT NULL,
    [street] varchar(255) NULL,
    [city] varchar(50) NULL,
    [state] varchar(25) NULL,
    [zip_code] varchar(5) NULL,
    CONSTRAINT [PK__customer__CD65CB8552D24DD7] PRIMARY KEY ([customer_id])
);
GO

CREATE TABLE [sales].[stores] (
    [store_id] int NOT NULL IDENTITY,
    [store_name] varchar(255) NOT NULL,
    [phone] varchar(25) NULL,
    [email] varchar(255) NULL,
    [street] varchar(255) NULL,
    [city] varchar(255) NULL,
    [state] varchar(10) NULL,
    [zip_code] varchar(5) NULL,
    CONSTRAINT [PK__stores__A2F2A30C9E449D05] PRIMARY KEY ([store_id])
);
GO

CREATE TABLE [production].[products] (
    [product_id] int NOT NULL IDENTITY,
    [product_name] varchar(255) NOT NULL,
    [brand_id] int NOT NULL,
    [category_id] int NOT NULL,
    [model_year] smallint NOT NULL,
    [list_price] decimal(10,2) NOT NULL,
    CONSTRAINT [PK__products__47027DF5406FE33E] PRIMARY KEY ([product_id]),
    CONSTRAINT [FK__products__brand___3C69FB99] FOREIGN KEY ([brand_id]) REFERENCES [production].[brands] ([brand_id]) ON DELETE CASCADE,
    CONSTRAINT [FK__products__catego__3B75D760] FOREIGN KEY ([category_id]) REFERENCES [production].[categories] ([category_id]) ON DELETE CASCADE
);
GO

CREATE TABLE [sales].[staffs] (
    [staff_id] int NOT NULL IDENTITY,
    [first_name] varchar(50) NOT NULL,
    [last_name] varchar(50) NOT NULL,
    [email] varchar(255) NOT NULL,
    [phone] varchar(25) NULL,
    [active] tinyint NOT NULL,
    [store_id] int NOT NULL,
    [manager_id] int NULL,
    CONSTRAINT [PK__staffs__1963DD9C445E60C6] PRIMARY KEY ([staff_id]),
    CONSTRAINT [FK__staffs__manager___44FF419A] FOREIGN KEY ([manager_id]) REFERENCES [sales].[staffs] ([staff_id]),
    CONSTRAINT [FK__staffs__store_id__440B1D61] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE
);
GO

CREATE TABLE [production].[stocks] (
    [store_id] int NOT NULL,
    [product_id] int NOT NULL,
    [quantity] int NULL,
    CONSTRAINT [PK__stocks__E68284D3661E2155] PRIMARY KEY ([store_id], [product_id]),
    CONSTRAINT [FK__stocks__product___52593CB8] FOREIGN KEY ([product_id]) REFERENCES [production].[products] ([product_id]) ON DELETE CASCADE,
    CONSTRAINT [FK__stocks__store_id__5165187F] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE
);
GO

CREATE TABLE [sales].[orders] (
    [order_id] int NOT NULL IDENTITY,
    [customer_id] int NULL,
    [order_status] tinyint NOT NULL,
    [order_date] date NOT NULL,
    [required_date] date NOT NULL,
    [shipped_date] date NULL,
    [store_id] int NOT NULL,
    [staff_id] int NOT NULL,
    CONSTRAINT [PK__orders__465962298C6398B5] PRIMARY KEY ([order_id]),
    CONSTRAINT [FK__orders__customer__47DBAE45] FOREIGN KEY ([customer_id]) REFERENCES [sales].[customers] ([customer_id]) ON DELETE CASCADE,
    CONSTRAINT [FK__orders__staff_id__49C3F6B7] FOREIGN KEY ([staff_id]) REFERENCES [sales].[staffs] ([staff_id]),
    CONSTRAINT [FK__orders__store_id__48CFD27E] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE
);
GO

CREATE TABLE [sales].[order_items] (
    [order_id] int NOT NULL,
    [item_id] int NOT NULL,
    [product_id] int NOT NULL,
    [quantity] int NOT NULL,
    [list_price] decimal(10,2) NOT NULL,
    [discount] decimal(4,2) NOT NULL,
    CONSTRAINT [PK__order_it__837942D45BE023DB] PRIMARY KEY ([order_id], [item_id]),
    CONSTRAINT [FK__order_ite__order__4D94879B] FOREIGN KEY ([order_id]) REFERENCES [sales].[orders] ([order_id]) ON DELETE CASCADE,
    CONSTRAINT [FK__order_ite__produ__4E88ABD4] FOREIGN KEY ([product_id]) REFERENCES [production].[products] ([product_id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_order_items_product_id] ON [sales].[order_items] ([product_id]);
GO

CREATE INDEX [IX_orders_customer_id] ON [sales].[orders] ([customer_id]);
GO

CREATE INDEX [IX_orders_staff_id] ON [sales].[orders] ([staff_id]);
GO

CREATE INDEX [IX_orders_store_id] ON [sales].[orders] ([store_id]);
GO

CREATE INDEX [IX_products_brand_id] ON [production].[products] ([brand_id]);
GO

CREATE INDEX [IX_products_category_id] ON [production].[products] ([category_id]);
GO

CREATE INDEX [IX_staffs_manager_id] ON [sales].[staffs] ([manager_id]);
GO

CREATE INDEX [IX_staffs_store_id] ON [sales].[staffs] ([store_id]);
GO

CREATE UNIQUE INDEX [UQ__staffs__AB6E6164D598E8F2] ON [sales].[staffs] ([email]);
GO

CREATE INDEX [IX_stocks_product_id] ON [production].[stocks] ([product_id]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240920233008_1', N'8.0.8');
GO

COMMIT;
GO


USE [master]
GO

CREATE DATABASE [Aroma_Dom_6_var]

CREATE TABLE [dbo].[material](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_type_id] [int] NOT NULL,
	[material_name] [nvarchar](200) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[unit_name] [nvarchar](20) NOT NULL,
	[package_quantity] [decimal](10, 2) NOT NULL,
	[stock_quantity] [decimal](10, 2) NOT NULL,
	[min_quantity] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_material] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_type](
	[material_type_id] [int] IDENTITY(1,1) NOT NULL,
	[material_type_name] [nvarchar](100) NOT NULL,
	[loss_percent] [decimal](5, 2) NOT NULL,
 CONSTRAINT [pk_material_type] PRIMARY KEY CLUSTERED 
(
	[material_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_id] [int] NOT NULL,
	[article] [nvarchar](20) NOT NULL,
	[product_name] [nvarchar](200) NOT NULL,
	[min_partner_price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[product_type_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_name] [nvarchar](100) NOT NULL,
	[product_coefficient] [decimal](5, 2) NOT NULL,
 CONSTRAINT [pk_product_type] PRIMARY KEY CLUSTERED 
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe](
	[material_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity_per_unit] [decimal](10, 3) NOT NULL,
 CONSTRAINT [pk_recipe] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[material] ON 
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (1, 1, N'Соевый воск премиум', CAST(890.00 AS Decimal(10, 2)), N'кг', CAST(20.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (2, 1, N'Соевый воск EcoBlend', CAST(760.00 AS Decimal(10, 2)), N'кг', CAST(25.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (3, 2, N'Пчелиный воск натуральный', CAST(1450.00 AS Decimal(10, 2)), N'кг', CAST(10.00 AS Decimal(10, 2)), CAST(48.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (4, 3, N'Масло лаванды', CAST(3200.00 AS Decimal(10, 2)), N'л', CAST(1.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (5, 3, N'Масло ванили', CAST(2950.00 AS Decimal(10, 2)), N'л', CAST(1.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (6, 3, N'Масло цитрусовое', CAST(2870.00 AS Decimal(10, 2)), N'л', CAST(1.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (7, 4, N'Краситель янтарный', CAST(640.00 AS Decimal(10, 2)), N'кг', CAST(0.50 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (8, 4, N'Краситель розовый', CAST(615.00 AS Decimal(10, 2)), N'кг', CAST(0.50 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (9, 5, N'Фитиль хлопковый 8 см', CAST(4.50 AS Decimal(10, 2)), N'шт', CAST(500.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (10, 5, N'Фитиль хлопковый 12 см', CAST(5.80 AS Decimal(10, 2)), N'шт', CAST(400.00 AS Decimal(10, 2)), CAST(1800.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (11, 6, N'Стакан прозрачный 200 мл', CAST(28.00 AS Decimal(10, 2)), N'шт', CAST(100.00 AS Decimal(10, 2)), CAST(950.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (12, 6, N'Стакан матовый 250 мл', CAST(34.00 AS Decimal(10, 2)), N'шт', CAST(60.00 AS Decimal(10, 2)), CAST(620.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (13, 7, N'Чаша керамическая белая', CAST(72.00 AS Decimal(10, 2)), N'шт', CAST(40.00 AS Decimal(10, 2)), CAST(280.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (14, 8, N'Сухоцветы лаванды', CAST(520.00 AS Decimal(10, 2)), N'кг', CAST(0.30 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (15, 9, N'Лента сатиновая бежевая', CAST(12.00 AS Decimal(10, 2)), N'м', CAST(50.00 AS Decimal(10, 2)), CAST(340.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (16, 9, N'Коробка подарочная малая', CAST(18.00 AS Decimal(10, 2)), N'шт', CAST(50.00 AS Decimal(10, 2)), CAST(420.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (17, 10, N'Этикетка фирменная круглая', CAST(3.20 AS Decimal(10, 2)), N'шт', CAST(250.00 AS Decimal(10, 2)), CAST(1800.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[material] ([material_id], [material_type_id], [material_name], [price], [unit_name], [package_quantity], [stock_quantity], [min_quantity]) VALUES (18, 10, N'Наклейка предупреждающая', CAST(2.10 AS Decimal(10, 2)), N'шт', CAST(200.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[material] OFF
GO
SET IDENTITY_INSERT [dbo].[material_type] ON 
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (1, N'Соевый воск', CAST(0.12 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (2, N'Пчелиный воск', CAST(0.18 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (3, N'Ароматическое масло', CAST(0.25 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (4, N'Краситель', CAST(0.08 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (5, N'Фитиль', CAST(0.03 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (6, N'Стеклянная тара', CAST(0.04 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (7, N'Керамическая тара', CAST(0.06 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (8, N'Декор', CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (9, N'Упаковка', CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[material_type] ([material_type_id], [material_type_name], [loss_percent]) VALUES (10, N'Этикетка', CAST(0.02 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (1, 1, N'AR-001', N'Свеча «Лавандовый вечер»', CAST(980.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (2, 1, N'AR-002', N'Свеча «Ванильный крем»', CAST(950.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (3, 1, N'AR-003', N'Свеча «Цитрусовый сад»', CAST(970.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (4, 2, N'AR-004', N'Свеча «Белый мускус»', CAST(1290.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (5, 2, N'AR-005', N'Свеча «Дикая орхидея»', CAST(1360.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (6, 4, N'AR-006', N'Свеча «Теплый янтарь»', CAST(1490.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (7, 4, N'AR-007', N'Свеча «Сандаловое дерево»', CAST(1520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (8, 5, N'AR-008', N'Мини-свеча «Лаванда»', CAST(420.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (9, 5, N'AR-009', N'Мини-свеча «Ваниль»', CAST(410.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (10, 5, N'AR-010', N'Мини-свеча «Цитрус»', CAST(430.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (11, 3, N'AR-011', N'Набор «Уютный дом»', CAST(2190.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (12, 3, N'AR-012', N'Набор «Теплый вечер»', CAST(2340.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (13, 6, N'AR-013', N'Свеча «Зимние специи»', CAST(1380.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[product] ([product_id], [product_type_id], [article], [product_name], [min_partner_price]) VALUES (14, 6, N'AR-014', N'Свеча «Хвойный лес»', CAST(1410.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_type] ON 
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (1, N'Классическая свеча', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (2, N'Премиальная свеча', CAST(1.15 AS Decimal(5, 2)))
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (3, N'Подарочный набор', CAST(1.30 AS Decimal(5, 2)))
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (4, N'Интерьерная свеча', CAST(1.20 AS Decimal(5, 2)))
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (5, N'Мини-свеча', CAST(0.80 AS Decimal(5, 2)))
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name], [product_coefficient]) VALUES (6, N'Сезонная коллекция', CAST(1.25 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[product_type] OFF
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 1, CAST(0.180 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 2, CAST(0.180 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 4, CAST(0.220 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 5, CAST(0.225 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 11, CAST(0.180 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 12, CAST(0.225 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 13, CAST(0.210 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (1, 14, CAST(0.215 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (2, 3, CAST(0.175 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (2, 8, CAST(0.070 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (2, 9, CAST(0.070 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (2, 10, CAST(0.070 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (3, 6, CAST(0.280 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (3, 7, CAST(0.285 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (4, 1, CAST(0.009 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (4, 5, CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (4, 8, CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (4, 11, CAST(0.009 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 2, CAST(0.010 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 4, CAST(0.006 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 7, CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 9, CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 12, CAST(0.010 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (5, 13, CAST(0.008 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (6, 3, CAST(0.011 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (6, 10, CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (6, 14, CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (7, 6, CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (7, 13, CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (7, 14, CAST(0.002 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 1, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 2, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 3, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 8, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 9, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 10, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (9, 11, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 4, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 5, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 6, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 7, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 12, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 13, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (10, 14, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 1, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 2, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 3, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 8, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 9, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 10, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (11, 11, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (12, 4, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (12, 5, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (12, 12, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (12, 13, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (12, 14, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (13, 6, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (13, 7, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (15, 11, CAST(1.200 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (15, 12, CAST(1.500 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (16, 11, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (16, 12, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 1, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 2, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 3, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 4, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 5, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 6, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 7, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 11, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (17, 12, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (18, 13, CAST(1.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[recipe] ([material_id], [product_id], [quantity_per_unit]) VALUES (18, 14, CAST(1.000 AS Decimal(10, 3)))
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[material] ADD  CONSTRAINT [uq_material_name] UNIQUE NONCLUSTERED 
(
	[material_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ix_material_material_type_id] ON [dbo].[material]
(
	[material_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[material_type] ADD  CONSTRAINT [uq_material_type_name] UNIQUE NONCLUSTERED 
(
	[material_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[product] ADD  CONSTRAINT [uq_product_article] UNIQUE NONCLUSTERED 
(
	[article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[product] ADD  CONSTRAINT [uq_product_name] UNIQUE NONCLUSTERED 
(
	[product_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ix_product_product_type_id] ON [dbo].[product]
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[product_type] ADD  CONSTRAINT [uq_product_type_name] UNIQUE NONCLUSTERED 
(
	[product_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ix_recipe_product_id] ON [dbo].[recipe]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [fk_material_material_type] FOREIGN KEY([material_type_id])
REFERENCES [dbo].[material_type] ([material_type_id])
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [fk_material_material_type]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_product_product_type] FOREIGN KEY([product_type_id])
REFERENCES [dbo].[product_type] ([product_type_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_product_product_type]
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD  CONSTRAINT [fk_recipe_material] FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[recipe] CHECK CONSTRAINT [fk_recipe_material]
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD  CONSTRAINT [fk_recipe_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[recipe] CHECK CONSTRAINT [fk_recipe_product]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [ck_material_min] CHECK  (([min_quantity]>=(0)))
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [ck_material_min]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [ck_material_package] CHECK  (([package_quantity]>(0)))
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [ck_material_package]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [ck_material_price] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [ck_material_price]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [ck_material_stock] CHECK  (([stock_quantity]>=(0)))
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [ck_material_stock]
GO
ALTER TABLE [dbo].[material_type]  WITH CHECK ADD  CONSTRAINT [ck_material_type_loss] CHECK  (([loss_percent]>=(0) AND [loss_percent]<=(100)))
GO
ALTER TABLE [dbo].[material_type] CHECK CONSTRAINT [ck_material_type_loss]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [ck_product_price] CHECK  (([min_partner_price]>=(0)))
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [ck_product_price]
GO
ALTER TABLE [dbo].[product_type]  WITH CHECK ADD  CONSTRAINT [ck_product_type_coef] CHECK  (([product_coefficient]>(0)))
GO
ALTER TABLE [dbo].[product_type] CHECK CONSTRAINT [ck_product_type_coef]
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD  CONSTRAINT [ck_recipe_quantity] CHECK  (([quantity_per_unit]>(0)))
GO
ALTER TABLE [dbo].[recipe] CHECK CONSTRAINT [ck_recipe_quantity]
GO
USE [master]
GO
ALTER DATABASE [Aroma_Dom_6_var] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [TestSCM]    Script Date: 08-09-2020 10:25:56 ******/
CREATE DATABASE [TestSCM]
 GO
USE [TestSCM]
GO 
/****** Object:  Table [dbo].[Items]    Script Date: 08-09-2020 10:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[UnitPrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PromoItems]    Script Date: 08-09-2020 10:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoItems](
	[PromoItemId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[PromotionalQty] [int] NOT NULL,
	[FixedPrice] [numeric](18, 2) NOT NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_PromoItems] PRIMARY KEY CLUSTERED 
(
	[PromoItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [UnitPrice]) VALUES (N'af29df4e-4d07-4eb7-856b-324919671529', N'C', CAST(20.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [UnitPrice]) VALUES (N'580bc183-16df-42a4-a6e6-36691c424c6f', N'A', CAST(50.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [UnitPrice]) VALUES (N'e2f0b74e-fc18-462d-b11c-712e22302ae1', N'B', CAST(30.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [UnitPrice]) VALUES (N'1f999882-053c-40f3-ab7e-b208d28cce50', N'D', CAST(15.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[PromoItems] ([PromoItemId], [ItemId], [PromotionalQty], [FixedPrice], [GroupId]) VALUES (N'e4fdf263-88d6-4505-81ad-3300fbec4fb6', N'e2f0b74e-fc18-462d-b11c-712e22302ae1', 2, CAST(45.00 AS Numeric(18, 2)), NULL)
GO
INSERT [dbo].[PromoItems] ([PromoItemId], [ItemId], [PromotionalQty], [FixedPrice], [GroupId]) VALUES (N'ccc05f74-c800-4f23-b358-37acd4126ccb', N'580bc183-16df-42a4-a6e6-36691c424c6f', 3, CAST(130.00 AS Numeric(18, 2)), NULL)
GO
INSERT [dbo].[PromoItems] ([PromoItemId], [ItemId], [PromotionalQty], [FixedPrice], [GroupId]) VALUES (N'c8ae8a22-7e5c-41a7-948b-71aa69a61bc0', N'1f999882-053c-40f3-ab7e-b208d28cce50', 1, CAST(30.00 AS Numeric(18, 2)), 1)
GO
INSERT [dbo].[PromoItems] ([PromoItemId], [ItemId], [PromotionalQty], [FixedPrice], [GroupId]) VALUES (N'ada72ea5-0baf-44a8-ba71-a3a9333b369c', N'af29df4e-4d07-4eb7-856b-324919671529', 1, CAST(30.00 AS Numeric(18, 2)), 1)
GO
ALTER TABLE [dbo].[PromoItems]  WITH CHECK ADD  CONSTRAINT [FK_PromoItems_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[PromoItems] CHECK CONSTRAINT [FK_PromoItems_Items]
GO
USE [master]
GO
ALTER DATABASE [TestSCM] SET  READ_WRITE 
GO

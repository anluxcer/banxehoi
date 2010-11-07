USE [XeHoi]
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacture](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LHSo]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LHSo](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_HS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KSGX]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KSGX](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_KSGX] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CxDxR]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CxDxR](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_CxDxR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CRCoSo]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRCoSo](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_CRCS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Type] [bit] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ManufactureID] [int] NOT NULL,
	[Year] [date] NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKichThuoc]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKichThuoc](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CxDxRID] [int] NOT NULL,
	[CRCS] [int] NOT NULL,
	[KSGX] [int] NOT NULL,
 CONSTRAINT [PK_ThongSoKichThuoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoHopSo]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoHopSo](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LHS_ID] [int] NOT NULL,
 CONSTRAINT [PK_ThongSoHopSo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/07/2010 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ModelID] [int] NOT NULL,
	[ManufactureID] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[MadeIn] [nvarchar](50) NULL,
	[ImageData] [varbinary](max) NULL,
	[ImageMimeType] [varchar](50) NULL,
	[TSKT_ID] [int] NOT NULL,
	[TSHS_ID] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Status] [bit] NULL,
	[ImagePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Model_Manufacture]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Manufacture] FOREIGN KEY([ManufactureID])
REFERENCES [dbo].[Manufacture] ([ID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Manufacture]
GO
/****** Object:  ForeignKey [FK_Products_Manufacture]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacture] FOREIGN KEY([ManufactureID])
REFERENCES [dbo].[Manufacture] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Manufacture]
GO
/****** Object:  ForeignKey [FK_Products_Model]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Model]
GO
/****** Object:  ForeignKey [FK_Products_ThongSoHopSo]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_ThongSoHopSo] FOREIGN KEY([TSHS_ID])
REFERENCES [dbo].[ThongSoHopSo] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_ThongSoHopSo]
GO
/****** Object:  ForeignKey [FK_Products_ThongSoKichThuoc]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_ThongSoKichThuoc] FOREIGN KEY([TSKT_ID])
REFERENCES [dbo].[ThongSoKichThuoc] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_ThongSoKichThuoc]
GO
/****** Object:  ForeignKey [FK_ThongSoHopSo_LHS]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[ThongSoHopSo]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoHopSo_LHS] FOREIGN KEY([LHS_ID])
REFERENCES [dbo].[LHSo] ([ID])
GO
ALTER TABLE [dbo].[ThongSoHopSo] CHECK CONSTRAINT [FK_ThongSoHopSo_LHS]
GO
/****** Object:  ForeignKey [FK_ThongSoKichThuoc_CRCoSo]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[ThongSoKichThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKichThuoc_CRCoSo] FOREIGN KEY([CRCS])
REFERENCES [dbo].[CRCoSo] ([ID])
GO
ALTER TABLE [dbo].[ThongSoKichThuoc] CHECK CONSTRAINT [FK_ThongSoKichThuoc_CRCoSo]
GO
/****** Object:  ForeignKey [FK_ThongSoKichThuoc_CxDxR]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[ThongSoKichThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKichThuoc_CxDxR] FOREIGN KEY([CxDxRID])
REFERENCES [dbo].[CxDxR] ([ID])
GO
ALTER TABLE [dbo].[ThongSoKichThuoc] CHECK CONSTRAINT [FK_ThongSoKichThuoc_CxDxR]
GO
/****** Object:  ForeignKey [FK_ThongSoKichThuoc_KSGX]    Script Date: 11/07/2010 20:39:55 ******/
ALTER TABLE [dbo].[ThongSoKichThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKichThuoc_KSGX] FOREIGN KEY([KSGX])
REFERENCES [dbo].[KSGX] ([ID])
GO
ALTER TABLE [dbo].[ThongSoKichThuoc] CHECK CONSTRAINT [FK_ThongSoKichThuoc_KSGX]
GO

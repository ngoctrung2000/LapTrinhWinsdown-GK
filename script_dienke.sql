USE [csdl_dienke]
GO
/****** Object:  Table [dbo].[dienke]    Script Date: 7/22/2021 10:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dienke](
	[madk] [nvarchar](50) NOT NULL,
	[ngaydk] [datetime] NULL,
	[makh] [nvarchar](50) NULL,
 CONSTRAINT [PK_dienke] PRIMARY KEY CLUSTERED 
(
	[madk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 7/22/2021 10:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [nvarchar](50) NOT NULL,
	[tenkh] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kysudung]    Script Date: 7/22/2021 10:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kysudung](
	[maky] [nvarchar](10) NOT NULL,
	[tungay] [datetime] NULL,
	[denngay] [datetime] NULL,
 CONSTRAINT [PK_kysudung] PRIMARY KEY CLUSTERED 
(
	[maky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 7/22/2021 10:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manv] [nvarchar](50) NOT NULL,
	[tennv] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_nhanvien] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sudungdien]    Script Date: 7/22/2021 10:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sudungdien](
	[maky] [nvarchar](10) NOT NULL,
	[madk] [nvarchar](50) NOT NULL,
	[chisocu] [int] NULL,
	[chisomoi] [int] NULL,
	[manv] [nvarchar](50) NULL,
 CONSTRAINT [PK_sudungdien] PRIMARY KEY CLUSTERED 
(
	[maky] ASC,
	[madk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dienke]  WITH CHECK ADD  CONSTRAINT [FK_dienke_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[dienke] CHECK CONSTRAINT [FK_dienke_khachhang]
GO
ALTER TABLE [dbo].[sudungdien]  WITH CHECK ADD  CONSTRAINT [FK_sudungdien_dienke] FOREIGN KEY([madk])
REFERENCES [dbo].[dienke] ([madk])
GO
ALTER TABLE [dbo].[sudungdien] CHECK CONSTRAINT [FK_sudungdien_dienke]
GO
ALTER TABLE [dbo].[sudungdien]  WITH CHECK ADD  CONSTRAINT [FK_sudungdien_kysudung] FOREIGN KEY([maky])
REFERENCES [dbo].[kysudung] ([maky])
GO
ALTER TABLE [dbo].[sudungdien] CHECK CONSTRAINT [FK_sudungdien_kysudung]
GO
ALTER TABLE [dbo].[sudungdien]  WITH CHECK ADD  CONSTRAINT [FK_sudungdien_nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[sudungdien] CHECK CONSTRAINT [FK_sudungdien_nhanvien]
GO


INSERT INTO [dbo].[khachhang] ([makh], [tenkh], [dienthoai], [diachi]) VALUES (N'kh001', N'Lê Hải', N'0903700270', N'921 Trần Hưng Đạo')
INSERT INTO [dbo].[khachhang] ([makh], [tenkh], [dienthoai], [diachi]) VALUES (N'kh002', N'Trần Xung', N'0975443311', N'254 Lê Lai')
INSERT INTO [dbo].[khachhang] ([makh], [tenkh], [dienthoai], [diachi]) VALUES (N'kh003', N'Lý Đức', N'0983321200', N'3401 Phạm Văn Chiêu')

INSERT INTO [dbo].[nhanvien] ([manv], [tennv], [dienthoai], [diachi]) VALUES (N'nv001', N'Trần Chung', N'097533210', N'239 Phạm Thế Hiển')
INSERT INTO [dbo].[nhanvien] ([manv], [tennv], [dienthoai], [diachi]) VALUES (N'nv002', N'Nguyễn Hòa', N'098774356', N'344 Ông Ích Khiêm')

INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'a', N'2019-12-21 00:00:00', N'kh001')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'b', N'2021-07-19 00:00:00', N'kh002')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'c', N'2021-07-18 00:00:00', N'kh001')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'dk001', N'2016-02-20 00:00:00', N'kh001')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'dk002', N'2016-03-23 00:00:00', N'kh001')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'dk003', N'2016-02-10 00:00:00', N'kh002')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'dk004', N'2016-03-27 00:00:00', N'kh003')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N's', N'2019-12-19 00:00:00', N'kh002')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'x', N'2021-07-19 00:00:00', N'kh001')
INSERT INTO [dbo].[dienke] ([madk], [ngaydk], [makh]) VALUES (N'y', N'2021-07-19 00:00:00', N'kh002')

INSERT INTO [dbo].[kysudung] ([maky], [tungay], [denngay]) VALUES (N'06', N'2018-06-14 00:00:00', N'2018-07-13 00:00:00')
INSERT INTO [dbo].[kysudung] ([maky], [tungay], [denngay]) VALUES (N'07', N'2018-07-14 00:00:00', N'2018-08-14 00:00:00')
INSERT INTO [dbo].[kysudung] ([maky], [tungay], [denngay]) VALUES (N'08', N'2018-08-14 00:00:00', N'2018-08-15 00:00:00')
INSERT INTO [dbo].[kysudung] ([maky], [tungay], [denngay]) VALUES (N'a', N'2020-04-04 00:00:00', N'2020-04-05 00:00:00')

INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'06', N'dk001', 10, 50, N'nv001')
INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'06', N'dk002', 60, 180, N'nv001')
INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'06', N'dk003', 50, 130, N'nv001')
INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'06', N'dk004', 40, 270, N'nv001')
INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'07', N'dk001', 50, 200, N'nv001')
INSERT INTO [dbo].[sudungdien] ([maky], [madk], [chisocu], [chisomoi], [manv]) VALUES (N'07', N'dk002', 120, 300, N'nv002')

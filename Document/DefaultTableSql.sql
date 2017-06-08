/****** Object:  Table [dbo].[GameBasicInfo]    Script Date: 06/09/2017 00:35:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GameBasicInfo](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](50) NOT NULL,
	[MinPlayer] [int] NOT NULL,
	[MaxPlayer] [int] NOT NULL,
	[Time] [int] NOT NULL,
	[Difficulty] [int] NOT NULL,
	[Luck] [int] NOT NULL,
	[Strategy] [int] NOT NULL,
	[Interaction] [int] NOT NULL,
	[ImgName] [nvarchar](50) NOT NULL,
	[RentalNumber] [int] NOT NULL,
	[IsExtension] [bit] NOT NULL,
	[RentalStartDate] [datetime] NULL,
	[Rent] [int] NULL,
	[Deposit] [int] NULL,
	[TeachingUrl] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_GameBasicInfo] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[GameCategory]    Script Date: 06/09/2017 00:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GameCategory](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[GamePK] [int] NOT NULL,
	[TreeItemPK] [int] NOT NULL,
 CONSTRAINT [PK_GameCategory] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[GameExtension]    Script Date: 06/09/2017 00:40:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GameExtension](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[GamePK] [int] NOT NULL,
	[GameName] [nvarchar](50) NOT NULL,
	[RentalStartDate] [datetime] NULL,
	[Rent] [int] NULL,
	[Deposit] [int] NULL,
	[TeachingUrl] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_GameExtension] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ScoreRecord]    Script Date: 06/09/2017 00:40:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ScoreRecord](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[GamePK] [int] NOT NULL,
	[Creator] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_Score_Record] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Tree]    Script Date: 06/09/2017 00:40:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tree](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tree] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[TreeItem]    Script Date: 06/09/2017 00:41:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TreeItem](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[TreePK] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TreeItem] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
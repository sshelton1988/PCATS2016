/****** Object:  Table [dbo].[DT_Business_Unit]    Script Date: 5/22/2015 8:58:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DT_Business_Unit](
	[Bus_Unit_ID] [int] NOT NULL,
	[Bus_Unit_Description] [ntext] NULL,
 CONSTRAINT [PK_DT_Business_Unit] PRIMARY KEY CLUSTERED 
(
	[Bus_Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

insert into DT_Business_Unit values (1,'Engineering')
insert into DT_Business_Unit values (2,'Program Management')
insert into DT_Business_Unit values (3,'Pipeline Services')
insert into DT_Business_Unit values (4,'Staffing')
insert into DT_Business_Unit values (5,'Proposals')
insert into DT_Business_Unit values (6,'For All Business Unit')
GO


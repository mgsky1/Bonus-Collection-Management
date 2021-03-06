
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/05/2016 13:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](20) NULL,
	[LoginName] [varchar](20) NULL,
	[PW] [varchar](10) NULL,
	[Permission] [bit] NULL,
	[Phone] [varchar](15) NULL,
 CONSTRAINT [PK_dbo.Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIP1]    Script Date: 12/05/2016 13:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VIP1](
	[VIPNo] [varchar](10) NOT NULL,
	[VIPName] [varchar](20) NULL,
	[LoginName] [varchar](20) NULL,
	[PW] [varchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[RefereeCount] [int] NULL,
	[email] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIPNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIP]    Script Date: 12/05/2016 13:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VIP](
	[VIPNo] [varchar](10) NOT NULL,
	[VIPName] [varchar](20) NULL,
	[LoginName] [varchar](20) NULL,
	[PW] [varchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[RefereeCount] [int] NULL,
	[email] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIPNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment1]    Script Date: 12/05/2016 13:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment1](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[VIPNo] [varchar](10) NULL,
	[Phone] [varchar](50) NULL,
	[RefereeNo] [varchar](10) NULL,
	[Bank] [varchar](80) NULL,
	[CardNo] [varchar](30) NULL,
	[CardHolder] [varchar](20) NULL,
	[PayJpg] [text] NULL,
	[PaySpecify] [varchar](180) NULL,
	[ActiveState] [int] NOT NULL,
	[QueueNo] [int] NOT NULL,
	[DeQueue] [int] NOT NULL,
	[Checker] [varchar](20) NULL,
 CONSTRAINT [PK__Payment1__EE8FCE2F182C9B24] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/05/2016 13:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[VIPNo] [varchar](10) NULL,
	[Phone] [varchar](50) NULL,
	[RefereeNo] [varchar](10) NULL,
	[Bank] [varchar](80) NULL,
	[CardNo] [varchar](30) NULL,
	[CardHolder] [varchar](20) NULL,
	[PayJpg] [text] NULL,
	[PaySpecify] [varchar](180) NULL,
	[ActiveState] [int] NOT NULL,
	[QueueNo] [int] NOT NULL,
	[DeQueue] [int] NOT NULL,
	[Checker] [varchar](20) NULL,
 CONSTRAINT [PK__Payment__EE8FCE2F182C9B23] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [Tri_PayActive1]    Script Date: 12/05/2016 13:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[Tri_PayActive1] On [dbo].[Payment1] After Update as
Declare @n int
if Update(ActiveState)and((Select count(*) From Inserted)=1)
--只有在ActiveState字段发生更改时才执行触发器相关内容,多记录同时更新不考虑
if(Select ActiveState From Inserted)=1 --0未激活,1激活,-1无效
 Begin --激活后
  --求新尾值:QueueNo=max(QueueNo)+1
  Set @n=(Select max(QueueNo)+1 From Payment1);
  --当前记录激活入队
  Update Payment1 Set QueueNo=@n From Inserted b Where Payment1.PayID=b.PayID --入队
  --推荐人次数+1 
  Update VIP1 Set RefereeCount=IsNull(RefereeCount,0)+1 From Inserted b
   Where VIP1.VIPNo=b.RefereeNo
  --尾队为6,11,16,21,...时队头出队 
  if(@n%5=1)and(@n>1)
  Begin
   --要出队的推荐人数清0
   Update VIP1 Set RefereeCount=0
    Where VIP1.VIPNo=(Select top 1 VIPNo From Payment1 Where ActiveState=1 and DeQueue=0 Order By PayID)
   Update Payment1 Set DeQueue=(Select max(DeQueue)+1 From Payment1) --出队:DeQueue=max(DeQueue)+1 
    Where PayID=(Select min(PayID) From Payment1 Where ActiveState=1 and DeQueue=0)--激活的&未出队的&最早的->出队
  End 
  --推荐5次出队 
  if(Select RefereeCount From VIP1,Inserted b Where VIP1.VIPNo=b.RefereeNo)>=5
  Begin
   Update Payment1 Set DeQueue=(Select max(DeQueue)+1 From Payment1) From Inserted b--出队:DeQueue=max(DeQueue)+1
    Where Payment1.PayID=(Select min(a.PayID) From Payment1 a Where ActiveState=1 and DeQueue=0 and a.VIPNo=b.RefereeNo)
--激活的&未出队的&推荐人&最早的->出队  
   Update VIP1 Set RefereeCount=0 From Inserted b Where VIP1.VIPNo=b.RefereeNo
  End 
 End
GO
/****** Object:  Trigger [Tri_PayActive]    Script Date: 12/05/2016 13:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[Tri_PayActive] On [dbo].[Payment] After Update as
Declare @n int
if Update(ActiveState)and((Select count(*) From Inserted)=1)
--只有在ActiveState字段发生更改时才执行触发器相关内容,多记录同时更新不考虑
if(Select ActiveState From Inserted)=1 --0未激活,1激活,-1无效
 Begin --激活后
  --求新尾值:QueueNo=max(QueueNo)+1
  Set @n=(Select max(QueueNo)+1 From Payment);
  --当前记录激活入队
  Update Payment Set QueueNo=@n From Inserted b Where Payment.PayID=b.PayID --入队
  --推荐人次数+1 
  Update VIP Set RefereeCount=IsNull(RefereeCount,0)+1 From Inserted b
   Where VIP.VIPNo=b.RefereeNo
  --尾队为6,11,16,21,...时队头出队 
  if(@n%5=1)and(@n>1)
  Update Payment Set DeQueue=(Select max(DeQueue)+1 From Payment) --出队:DeQueue=max(DeQueue)+1 
   Where PayID=(Select min(PayID) From Payment Where ActiveState=1 and DeQueue=0)--激活的&未出队的&最早的->出队
  --推荐5次出队 
  if(Select RefereeCount From VIP,Inserted b Where VIP.VIPNo=b.RefereeNo)>=5
  Begin
   Update Payment Set DeQueue=(Select max(DeQueue)+1 From Payment) From Inserted b--出队:DeQueue=max(DeQueue)+1
    Where Payment.PayID=(Select min(a.PayID) From Payment a Where ActiveState=1 and DeQueue=0 and a.VIPNo=b.RefereeNo)--激活的&未出队的&推荐人&最早的->出队  
   Update VIP Set RefereeCount=0 From Inserted b Where VIP.VIPNo=b.RefereeNo
  End 
 End
GO
/****** Object:  View [dbo].[QueueView1]    Script Date: 12/05/2016 13:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--排队视图:已入队(QueueNo>0)但未出队(DeQueue=0) 
Create View [dbo].[QueueView1] as  --QueueNo=0(未激活时)未入队,激活后QueueNo>0,出队前DeQueue=0
Select * From Payment1 Where QueueNo>0 and DeQueue=0 
With Check Option
GO
/****** Object:  View [dbo].[QueueView]    Script Date: 12/05/2016 13:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--排队视图:已入队(QueueNo>0)但未出队(DeQueue=0)
Create View [dbo].[QueueView] as  --QueueNo=0(未激活时)未入队,激活后QueueNo>0,出队前DeQueue=0
Select * From Payment Where QueueNo>0 and DeQueue=0 
With Check Option
GO
/****** Object:  View [dbo].[DeQueueView1]    Script Date: 12/05/2016 13:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--出队视图
Create View [dbo].[DeQueueView1] as
Select * From Payment1 Where DeQueue>0
With Check Option
GO
/****** Object:  View [dbo].[DeQueueView]    Script Date: 12/05/2016 13:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--出队视图
Create View [dbo].[DeQueueView] as
Select * From Payment Where DeQueue>0
With Check Option
GO

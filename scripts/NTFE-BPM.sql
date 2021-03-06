/****** 对象:  Table [dbo].[NTFE_WorkItem]    脚本日期: 11/15/2011 12:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_WorkItem](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ArrivedTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[FinishTime] [datetime] NULL,
	[Result] [nvarchar](255) NULL,
	[OriginalActionerId] [uniqueidentifier] NULL,
	[ActionerId] [uniqueidentifier] NULL,
	[ProcessId] [uniqueidentifier] NULL,
	[ProcessTypeId] [uniqueidentifier] NULL,
	[ProcessTypeName] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[FlowNodeIndex] [int] NULL,
	[ActivityName] [nvarchar](50) NULL,
	[ReferredBookmarkName] [nvarchar](50) NULL,
	[HumanActivityInstanceId] [bigint] NULL,
 CONSTRAINT [PK_NTFE_WorkItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_Process]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_Process](
	[ID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[CreateTime] [datetime] NULL,
	[FinishTime] [datetime] NULL,
	[Priority] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[WorkflowData] [nvarchar](max) NULL,
	[OriginatorId] [uniqueidentifier] NULL,
	[ProcessTypeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_NTFE_Process] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_ProcessType]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_ProcessType](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[GroupName] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[IsCurrent] [bit] NULL,
	[WorkflowData] [nvarchar](max) NULL,
	[Version] [nvarchar](50) NULL,
 CONSTRAINT [PK_NTFE_ProcessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_TimeZone_WorkingDay]    脚本日期: 11/15/2011 12:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_TimeZone_WorkingDay](
	[ID] [uniqueidentifier] NOT NULL,
	[TimeZoneId] [uniqueidentifier] NULL,
	[Date] [datetime] NULL,
	[DayOfWeek] [nchar](10) NULL,
	[Description] [nvarchar](500) NULL,
	[WorkingHours] [nvarchar](max) NULL,
 CONSTRAINT [PK_NTFE_TimeZone_WorkingDay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_ActivityInstance]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_ActivityInstance](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkflowActivityInstanceId] [bigint] NULL,
	[ActivityName] [nvarchar](50) NULL,
	[FlowNodeIndex] [int] NULL,
	[ReferredBookmarkName] [nvarchar](50) NULL,
	[Actioners] [nvarchar](max) NULL,
	[AlreadyActioners] [nvarchar](max) NULL,
	[ProcessId] [uniqueidentifier] NULL,
	[FinishTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_NTFE_HumanTaskInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_Activity]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_Activity](
	[ID] [uniqueidentifier] NOT NULL,
	[Actions] [nvarchar](500) NULL,
	[ActivityName] [nvarchar](50) NULL,
	[FlowNodeIndex] [int] NULL,
	[IsChildOfActivity] [bit] NULL,
	[CanHaveChildren] [bit] NULL,
	[SettingType] [nvarchar](255) NULL,
	[SlotCount] [int] NULL,
	[SlotMode] [tinyint] NULL,
	[Url] [nvarchar](500) NULL,
	[ProcessTypeId] [uniqueidentifier] NULL,
	[StartRule_AfterMinutes] [float] NULL,
	[StartRule_At] [datetime] NULL,
	[StartRule_TimeZoneId] [uniqueidentifier] NULL,
	[ActionerRule_Script] [nvarchar](500) NULL,
	[FinishRule_Script] [nvarchar](500) NULL,
	[EscalationRule_AfterMinutes] [float] NULL,
	[EscalationRule_At] [datetime] NULL,
	[EscalationRule_TimeZoneId] [uniqueidentifier] NULL,
	[ServerScript] [nvarchar](500) NULL,
	[ServerResultTo] [nvarchar](50) NULL,
	[CompletionCondition] [nvarchar](500) NULL,
 CONSTRAINT [PK_NTFE_HumanSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_WaitingResumption]    脚本日期: 11/15/2011 12:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_WaitingResumption](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NULL,
	[Priority] [tinyint] NULL,
	[ProcessId] [uniqueidentifier] NULL,
	[At] [datetime] NULL,
	[ResumptionType] [nvarchar](255) NULL,
	[BookmarkName] [nvarchar](50) NULL,
	[ErrorNodeIndex] [int] NULL,
	[Value] [nvarchar](50) NULL,
	[ChargingBy] [nvarchar](50) NULL,
	[IsValid] [bit] NULL,
	[IsExecuted] [bit] NULL,
	[WorkItemIds] [nvarchar](max) NULL,
	[HumanActivityInstanceId] [bigint] NULL,
	[ActivityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_NTFE_WaitingResumption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_Agent]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_Agent](
	[ID] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Range] [tinyint] NULL,
	[ActAsUserId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_NTFE_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_Agent_ProcessActingItem]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_Agent_ProcessActingItem](
	[ID] [uniqueidentifier] NULL,
	[AgentId] [uniqueidentifier] NULL,
	[ProcessTypeName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_ProcessDataField]    脚本日期: 11/15/2011 12:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_ProcessDataField](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](500) NULL,
	[ProcessId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_NTFE_ProcessDataField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_TimeZone]    脚本日期: 11/15/2011 12:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_TimeZone](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_NTFE_TimeZone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_User]    脚本日期: 11/15/2011 12:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_User](
	[ID] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NULL,
	[UserName] [nvarchar](255) NULL,
 CONSTRAINT [PK_NTFE_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[NTFE_ErrorRecord]    脚本日期: 05/04/2012 18:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NTFE_ErrorRecord](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NULL,
	[Reason] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[ProcessId] [uniqueidentifier] NULL,
	[ErrorType] [nvarchar](50) NULL,
	[BookmarkName] [nvarchar](50) NULL,
	[ActivityName] [nvarchar](50) NULL,
	[ResumptionId] [bigint] NULL,
 CONSTRAINT [PK_NTFE_ErrorRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

--数据表变更在以下追加变化
--201203 父子流程
ALTER TABLE [dbo].[NTFE_Process]
	ADD [ParentProcessId] [uniqueidentifier] NULL
ALTER TABLE [dbo].[NTFE_Activity]
	ADD	[SubProcessTypeName] [nvarchar](50) NULL
--20120423 扩充节点实例信息
ALTER TABLE dbo.NTFE_ActivityInstance ADD
	ActivityInstanceType nvarchar(50) NULL,
	SubProcessId uniqueidentifier NULL
ALTER TABLE dbo.NTFE_WaitingResumption ADD
	SubProcessActivityInstanceId bigint NULL,
	ActivityInstanceId bigint NULL
--20120503 升级规则
ALTER TABLE [dbo].[NTFE_Activity] ADD 
	[EscalationRule_ExpirationMinutes] [float] NULL,
	[EscalationRule_NotifyRepeatMinutes] [float] NULL,
	[EscalationRule_NotifyTemplateName] [nvarchar](100) NULL,
	[EscalationRule_GotoActivityName] [nvarchar](100) NULL,
	[EscalationRule_RedirectTo] [nvarchar](50) NULL
--20120504 错误重试细粒度化
ALTER TABLE dbo.NTFE_WaitingResumption ADD
	IsError bit NULL,
	SubProcessId uniqueidentifier NULL
--20120508 清理调整
ALTER TABLE dbo.NTFE_Activity
	DROP COLUMN CanHaveChildren, EscalationRule_AfterMinutes, EscalationRule_At
--20120515 调度相关
ALTER TABLE [dbo].[NTFE_Process]
	ADD [ChargingBy] [nvarchar](50) NULL
--20120516 数据订正 
--ChargingBy预先生成
update NTFE_WaitingResumption set chargingby='ntfe01'
update NTFE_Process set chargingby='ntfe01'
--节点实例类型 原先只有human
update NTFE_ActivityInstance set ActivityInstanceType='human' where  ActivityInstanceType is null
--延迟调度项对应的流程状态都应为running
update NTFE_Process set Status=2 where id=(select ProcessId from NTFE_WaitingResumption where IsValid=1 and IsExecuted=0 and IsError=0 and At is not null)
--20120523调整workitem的不必要冗余
ALTER TABLE dbo.NTFE_WorkItem
	DROP COLUMN ProcessTypeId, ReferredBookmarkName, FlowNodeIndex




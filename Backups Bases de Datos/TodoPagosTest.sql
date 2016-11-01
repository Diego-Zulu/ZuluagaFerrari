USE [master]
GO
/****** Object:  Database [TodoPagosTest]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE DATABASE [TodoPagosTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TodoPagosTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TodoPagosTest.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TodoPagosTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TodoPagosTest_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TodoPagosTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TodoPagosTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TodoPagosTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TodoPagosTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TodoPagosTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TodoPagosTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TodoPagosTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [TodoPagosTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TodoPagosTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TodoPagosTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TodoPagosTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TodoPagosTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TodoPagosTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TodoPagosTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TodoPagosTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TodoPagosTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TodoPagosTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TodoPagosTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TodoPagosTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TodoPagosTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TodoPagosTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TodoPagosTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TodoPagosTest] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TodoPagosTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TodoPagosTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TodoPagosTest] SET  MULTI_USER 
GO
ALTER DATABASE [TodoPagosTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TodoPagosTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TodoPagosTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TodoPagosTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TodoPagosTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TodoPagosTest]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IFields]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Data] [datetime] NULL,
	[Data1] [bigint] NULL,
	[Data2] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Receipt_ID] [int] NULL,
	[Provider_ID] [int] NULL,
 CONSTRAINT [PK_dbo.IFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaidWith] [float] NOT NULL,
	[Change] [float] NOT NULL,
	[PaymentMethod_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayMethods]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMethods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayDate] [datetime] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.PayMethods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Privileges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Providers]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Commission] [float] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Providers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[ReceiptProvider_ID] [int] NULL,
	[Payment_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Receipts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePrivileges]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePrivileges](
	[Role_ID] [int] NOT NULL,
	[Privilege_ID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RolePrivileges] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC,
	[Privilege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[User_ID] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2016 3:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201610311834239_InitialCreate', N'TodoPagos.Domain.DataAccess.TodoPagosContext', 0x1F8B0800000000000400ED1DDB6EE3B8F5BD40FF41D0D36E918D936C516C8378171967D21ADD4CD27166DBB78096189BA82E5E494E1314FDB23EF493FA0B2575A17895484996ED4150603B91C8C373E7E1D1E1F1FFFEF3DFAB9F5EC3C07981498AE268EA9E9F9EB90E8CBCD847D16AEA6EB3E7EF7E707FFAF1B7BFB9FAE887AFCE2FD5B8EFC9383C334AA7EE3ACB36979349EAAD6108D2D31079499CC6CFD9A9178713E0C7938BB3B33F4ECECF27108370312CC7B9FABC8D3214C2FC0FFCE72C8E3CB8C9B620B88B7D18A4E573FC669143753E8110A61BE0C1A9FB18FBF10358C5E9E94D1C02149DDE800C5C7B1E4C53D7B90E10C0282D60F0EC3A208AE20C6418E1CB2F295C64491CAD161BFC00048F6F1B88C73D832085252197F570539ACE2E084D937A6205CADBA61946CE0EE0F9F7259326E2F44EAC762913311B3F6276676F84EA9C9553777E8B60E0BB8EB8D4E52C48C830059F8B29274EF1E7095506AC33E47F27CE6C1B64DB044E23B8CD12109C380FDB6580BCBFC0B7C7F81F309A46DB20C0225AA6F8AD974DDD2CD942164B8C271ECB3DC08F1E92780393ECED337CAE70BF719D093F6F224EA4D39839055DF328FBFEC2753E6164C032805409181E2CB238817F82114C4006FD07906530C1329CFB3067A3B4BAB016F96FB51AD63A6C49AE73075E7F86D12A5B4F5DFC4FD7B945AFD0AF9E94187C8910363C5832865BE46A524BB051AED818A0BD68E9ACDED2FD005258528E6DB0D419B7915DC47E2B7611441E51D895FA4FDB7009137BFA9979FBE60056CF3FFCBE23F98FF035B3279ECEDA37E963DBCA03780BB1455B31AB9CD397555FA1D77B00C8FF1BCAD6D494634C37542CD90C66B606D10ADA02F9045ED02A2743C22A97D71DCCD631368BCF30C847A56BB429B5B41CF1248CBC4DE2F0731CD420F8014F8B789B7804CFB869D4234856303347F733F420DA646923A6F52019C9EA9D163F3A40859A8DE9548CB2339E62D67B1061604E6F64339437C646533016E00CA4EB6E42E4660EBD6530284D9AE31CB844593702F8A97BA3A034442BD4CB39EFBB8FB4D675186FC9563ED0B6318BC34D0031227908A376C7A5309EA4B1B557D60C919CB36E5CC7ED033F7D413E4C1AD196C6CA680B43B4688BE3FA6D2D14219B9DA59CF46E1972401587214AD33C8DD02B32DBC1B15661C75E865EE8321F62AC6720EA61C80DF64BD555B65BE1951C4C09EF7B2A3C7A41012441AF89C67F496172FD303FA5D34E9CF2D17B3435B2EE6AB56E1E113DD16C1BF8CD13151EBF5DF0AFA85A517F2BBCAFD4B293DA1160761A4766BC2BDBC1291BAB4BFDF44DDADF35FA688A195195F4710DB23F8317F8B84669A1730A24C9C8A7D2666AFCEAA7922930AF7A590181636705E4FF7B5BC1BBD6770B0F3EE2E02ED8F92A0F204DFF1927FECE175A80201BD153E837A556FB135D83C2343BD9DFB51FA2C87E2BA2D3FAEF47C2F9BDC0A5F9E84E52200826F6683313F782F847904458C9FEBA85098269C7C0530364708218F49AA9AAA2F13B1081152459CECE21B516D0FEA823EBF6A64C036434AAAED334F6508E269F9817D2EEBC23FB18F98E510E9E4BBF15DF74EE30FA688311C6DC9CBABF939C641B6C1A7028537B3CF4B3D3D373D1FF31143733429746D2A1DB9A53625C4295626C43D768010547AA2A8246665BF0423C926B45A63B9FB39A58A591AC88D79DEC7748B42E21D7261F6D76AE55019AACA12DA7D789C5362A207EE46A335BF98B57AB3768D301DDA7326BCEDA6881704CD3CA4777661323010B91EBD20E4ABF3E14C14CC8A9434C157FD638154737733255A7492BA669892BF6EC591C6500E1E353558D51EDC2E4057C557DE9C128959B76AA4C871480173013B299759020F82489787E7EA9D92A08D454DA41149BA00688EAE397024CFD0D5B02424DAB0D93D2FD2811A1AEA915489D1851405146332A728AA3934C8B14942B26E76912C5E442C185C98C0A4A72156B1898B18DC50E62F2C134EEA284B09A35B1855619230F8D2A9998F3E01960C01CED773A993D46B1985534C61055AB7C038BDA822F065E45466F06491F42147AD31498198566AC746BC36D52164D24B60B0E68BF89EA55A4315AB38AD7BAAA882E4233E174172D91AA8FF4EE451DBC99856F5D9D8A14AD19F0B58BAA88E974858A34857246C11C8B7AB1B334E983267CE3F4A0C6B73707D85CA14CBC2EAC6B0BEC186CCBFDB081644528D7C6B20642AB64250DE0E8BBAB4971FFA07C7035D15C54B8BA039B0D8A56CCC585F289B3286E2DCCBE5BD857F187058C89972A8AF929B674A52C4EC00A0A6F4901800F6F519266A4D6760948FE78E687D230295CD5042DD5725C442A8BAA8A65AAE1E4DFE5478994FCFBFEF99B869B1C6540FBAD08B866EC2DA695D87D4E3664A4AFAA3A2EA72E3C108044F18D641607DB30D27D67699A5D7CF560E7174F6408571301739167138969365C6D62667D29E0D0D9599483B3F38B274A0858517D949F287F01C11672971F381028F51214A20860DA0E4C34EC8D85E3148E9449D14987BB9C712CF2A9AF541CA7742E4CA5C3DC1D195536D5FB7A6731DA7768683894A0ABFC87BD98B5337723E7FA9E050BA37E6A0EA9BA6AC1C2A99E1D92A0AB54C0E0410685DD25CEA8735DA309BEBC11C0CBBD7C78505E93BF5D7058BC953C9F7015E2587626E106C4813359BCAF710C7B4C4316A39BC8AACCB6BDACB43377E36AAADB142C84EAD9C188A74E6E0D160368927926C6A49DBA1B09B155FDDCFECD3CDFC52956AB3165DD3EA731E5B303D298869C5CDF58A282DD2996A01F9ADED316354B75D56A87C55F69ABD316D91D4B64D1544F77E0BC6F2C053C16FEEB2AFE0E9CF7DA42C5A388F5345F2C7AEE0A046C970D21AF1B78DF0B6A46D675E207C34CC900985AF66371356C25FBE13296ABB73F066F527CC11C723FE8201DF5B47DFB101D84F2660F0BA27C649321ABEEEDF029B2EAA939A4E2620E0BA57832BE86F15FAD954970B1ECCB2AE12D4E36CC6E938FF1EA563BEAEA2E996F465AC8C352E924E11FC5A42B926511424724ADD1AA1DDC3C2537F2E8BD2E1BD2C582066BEDD1D6C55925B3E4E9669FC114B269A9A5EB289D0AEA00CAD3529C7750EAA327BBB7E248F58276C7CAA7DE8AA2A931ECEA632A6843B81775D1E241694603BD83F914A990D2CEA748D30DF3E10D36ABA996ECE75486549D9632D18352A176F2FB3B19A9DCD42EACA9E775D71D5D8D6ABF6066C830462C7A3D282DD1D3DBDFCF8855B886FE459CA63AD16A93662AA35517F076F52A04DA10AE445D11DC797F2C0159A2D65BC86CA1B1F949B99AA13A0EAB12160AFEC9E5C91D5997031A40A072BDF3781AD62E46A97E5A1C42CFC8E513FA37AD9F2E6B97DBBBBF4BC5CCC510D7A9F6227C527F4B3318E66A71BAF8359805889C5FE9803B10A1679866C52D76F7E2ECFC42E81B7F383DDC2769EA73CD62B48DDC79918DD05006119EB6B68CE9D1622E7A0189B706C9372178FD968564D258856D2BED63DC32A175AA298CF30AC812AD728AED415C0C43109FE9E421724D63CE2F7EB0E63B7B5864C42BDD579D473E7C9DBAFFCAA75D3AF3BF3FD5334F9CFB049BD7A573E6FCDB963A2E90B44380996A8E81758BF0AFC3BCC416DDCF410CB29E1DBABBC190935B965217E6EF46F4CAA624C72B7CAEA1B4CA2B1AC119D21399372B549DD98E56147CB3E26E16A43A827772DD9D1CA8D6A2BBDBF28EAC58DD4DE55835476EE6DB4D7B060BB4F87EBD4BD4864A87AEB85F87E4860B6DF7E27FA583F3BB20F62208F9A3FEBB20B8A6A0BD20898D3F7B01639B7B5A00B2B2C95E5E529F0C92C7362501DB3589AE6419A114D374618159D8CB216E7BB6ACE75A206165CC5D3DAB3EB5682CE876B9D145ECF8564EEB25B7D1544627AD015A56B20539F63D244568457B2E1E9659AF4BAC0930215E1A04B33822EDD7915CA784953DF2D0060412FE72AED9647F219CA530C53737700323B27108E4992C65521344E10B0ADFC689DDF7ED1CA04167D5EC8D0164D493B2AB26E8AFAD0DAE07BA2BF32AA7D658D733820288F52C5AD3E58A20FAB5271D5BF4EAE3F3DE65DF527731A2F59B366D1D52092C3CC911AA818DB7312BC319C3175876AD1DA04BED1EB4C062931E51099ACB6AC6F00506452042BFB6D6D6B3E75299C27D7403499CE190941BF91C3D03A9077C3990265FF29BD6666E6609489876F9ED1C48A8AF990CAF3D4D553C9647E17D2890AAC683DB4B5402D40AEFAB54253BF18EAE4F6D35532328554B1193D04DB1B5B3F68EB488A640C4F5CD9A9877D21DCD7DAAC1D54657716699CF1959595A9CCF3E77AF7D28CB587B9695B28CB95D09B57DF443A4D85454141ADFE3BC3AA5D6B936E1F85AD4F14D5D7F1963F116D9BAB9A6C1B3089C06D01274FA46055ED75E58DFF3BEB9E5BD660D5D277371151ABC4B6BD037AA15B4BD8D252AE8695326A2BE68A1A241DB455A5E82EEFA8A35E83BF522DA16C512A3726B97B9943F56B248D91058045BEC7A12D8E2B10AACB24FB112DB26BE08EF75F85BF0A7F6884A62F47CAADECA4B8CFEAB03BCBD09FDCA64B7A73860F33395BF6D7198BF25A0EA5CDE4832EF5BD9AB74FD0916939C83FC3680B247FDDE48DC69F3FFEE245B68C3C174F337B1BA1189D4B5D76F6DD9AFB9F62185C1C2CDA1665255FB80E2D2D1F064572DF2DBC9565F2E51A71E387DD620BF2706287E5EA0E9870ADAA5CD8606756F8D2662C53D98BF823428897AF1B65E1BEAA5D0439168F1F30BF235217CB0D946A48EB9F8EB06A668558320F71423E871471A3A661E3DC7D5D14AC0A81A22D424E0F003F8E4B65992A167E011FF4FAE9DE53FDB5B357F0B97D09F47F7DB6CB3CD30C9305C06DC4F2793135AD3FAF96F4CF0385FDD6FC85FE9102460341129FDBE8F3E6C11D93E4BBC6F1585111A10E4E8579681115966A41C6CF546217D8A23434025FBE889F511E24809034BEFA3052045A5F6B861F5FB19AE80F7566FB13A20ED82E0D97E7583C02A01615AC2A8E7E33FB10EFBE1EB8FFF074B6EF66E51950000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[IFields] ON 

INSERT [dbo].[IFields] ([ID], [Name], [Data], [Data1], [Data2], [Discriminator], [Receipt_ID], [Provider_ID]) VALUES (1, N'Cedula', NULL, NULL, NULL, N'NumberField', NULL, 1)
INSERT [dbo].[IFields] ([ID], [Name], [Data], [Data1], [Data2], [Discriminator], [Receipt_ID], [Provider_ID]) VALUES (2, N'Nombre', NULL, NULL, NULL, N'TextField', NULL, 2)
INSERT [dbo].[IFields] ([ID], [Name], [Data], [Data1], [Data2], [Discriminator], [Receipt_ID], [Provider_ID]) VALUES (3, N'Cedula', NULL, 4901883, NULL, N'NumberField', 1, NULL)
INSERT [dbo].[IFields] ([ID], [Name], [Data], [Data1], [Data2], [Discriminator], [Receipt_ID], [Provider_ID]) VALUES (4, N'Nombre', NULL, NULL, N'Hola', N'TextField', 2, NULL)
SET IDENTITY_INSERT [dbo].[IFields] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([ID], [PaidWith], [Change], [PaymentMethod_ID]) VALUES (1, 250, 0, 1)
INSERT [dbo].[Payments] ([ID], [PaidWith], [Change], [PaymentMethod_ID]) VALUES (2, 250, 0, 2)
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[PayMethods] ON 

INSERT [dbo].[PayMethods] ([ID], [PayDate], [Discriminator]) VALUES (1, CAST(N'2008-09-22 11:01:54.000' AS DateTime), N'DebitPayMethod')
INSERT [dbo].[PayMethods] ([ID], [PayDate], [Discriminator]) VALUES (2, CAST(N'2008-09-22 11:01:54.000' AS DateTime), N'DebitPayMethod')
SET IDENTITY_INSERT [dbo].[PayMethods] OFF
SET IDENTITY_INSERT [dbo].[Privileges] ON 

INSERT [dbo].[Privileges] ([ID], [Name], [Discriminator]) VALUES (1, N'User Managment', N'UserManagementPrivilege')
INSERT [dbo].[Privileges] ([ID], [Name], [Discriminator]) VALUES (2, N'Register Provider', N'ProviderManagementPrivilege')
INSERT [dbo].[Privileges] ([ID], [Name], [Discriminator]) VALUES (3, N'Earning Queries', N'EarningQueriesPrivilege')
SET IDENTITY_INSERT [dbo].[Privileges] OFF
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([ID], [Commission], [Name], [Active]) VALUES (1, 10, N'Antel', 1)
INSERT [dbo].[Providers] ([ID], [Commission], [Name], [Active]) VALUES (2, 10, N'UTE', 1)
SET IDENTITY_INSERT [dbo].[Providers] OFF
SET IDENTITY_INSERT [dbo].[Receipts] ON 

INSERT [dbo].[Receipts] ([ID], [Amount], [ReceiptProvider_ID], [Payment_ID]) VALUES (1, 250, 1, 1)
INSERT [dbo].[Receipts] ([ID], [Amount], [ReceiptProvider_ID], [Payment_ID]) VALUES (2, 250, 2, 2)
SET IDENTITY_INSERT [dbo].[Receipts] OFF
INSERT [dbo].[RolePrivileges] ([Role_ID], [Privilege_ID]) VALUES (1, 1)
INSERT [dbo].[RolePrivileges] ([Role_ID], [Privilege_ID]) VALUES (1, 2)
INSERT [dbo].[RolePrivileges] ([Role_ID], [Privilege_ID]) VALUES (1, 3)
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [Discriminator]) VALUES (1, N'Admin', N'AdminRole')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[UserRoles] ([User_ID], [Role_ID]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Email], [Password], [Salt]) VALUES (1, N'Brulu', N'diego@bruno.com', N'顝퍈䛉贈톤怨蹈ﯞꔚ笘គ荅ᐂ銡㝅딢횶ힲ᤮荛౪펥師庽拢Ɬഛ␘䆬井圛�苬ꢖᓝꊻ뮄냱慡톩쉩', N'顝퍈䛉贈톤怨蹈ﯞꔚ笘គ荅ᐂ銡㝅딢횶ힲ᤮荛౪펥師庽拢Ɬ')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Provider_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Provider_ID] ON [dbo].[IFields]
(
	[Provider_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Receipt_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Receipt_ID] ON [dbo].[IFields]
(
	[Receipt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PaymentMethod_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentMethod_ID] ON [dbo].[Payments]
(
	[PaymentMethod_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payment_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Payment_ID] ON [dbo].[Receipts]
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptProvider_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptProvider_ID] ON [dbo].[Receipts]
(
	[ReceiptProvider_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Privilege_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Privilege_ID] ON [dbo].[RolePrivileges]
(
	[Privilege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Role_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Role_ID] ON [dbo].[RolePrivileges]
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Role_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Role_ID] ON [dbo].[UserRoles]
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_ID]    Script Date: 10/31/2016 3:37:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_ID] ON [dbo].[UserRoles]
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IFields_dbo.Providers_Provider_ID] FOREIGN KEY([Provider_ID])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[IFields] CHECK CONSTRAINT [FK_dbo.IFields_dbo.Providers_Provider_ID]
GO
ALTER TABLE [dbo].[IFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IFields_dbo.Receipts_Receipt_ID] FOREIGN KEY([Receipt_ID])
REFERENCES [dbo].[Receipts] ([ID])
GO
ALTER TABLE [dbo].[IFields] CHECK CONSTRAINT [FK_dbo.IFields_dbo.Receipts_Receipt_ID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Payments_dbo.PayMethods_PaymentMethod_ID] FOREIGN KEY([PaymentMethod_ID])
REFERENCES [dbo].[PayMethods] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_dbo.Payments_dbo.PayMethods_PaymentMethod_ID]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Receipts_dbo.Payments_Payment_ID] FOREIGN KEY([Payment_ID])
REFERENCES [dbo].[Payments] ([ID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_dbo.Receipts_dbo.Payments_Payment_ID]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Receipts_dbo.Providers_ReceiptProvider_ID] FOREIGN KEY([ReceiptProvider_ID])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_dbo.Receipts_dbo.Providers_ReceiptProvider_ID]
GO
ALTER TABLE [dbo].[RolePrivileges]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePrivileges_dbo.Privileges_Privilege_ID] FOREIGN KEY([Privilege_ID])
REFERENCES [dbo].[Privileges] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePrivileges] CHECK CONSTRAINT [FK_dbo.RolePrivileges_dbo.Privileges_Privilege_ID]
GO
ALTER TABLE [dbo].[RolePrivileges]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePrivileges_dbo.Roles_Role_ID] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePrivileges] CHECK CONSTRAINT [FK_dbo.RolePrivileges_dbo.Roles_Role_ID]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_Role_ID] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_Role_ID]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Users_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Users_User_ID]
GO
USE [master]
GO
ALTER DATABASE [TodoPagosTest] SET  READ_WRITE 
GO

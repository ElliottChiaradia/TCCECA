USE master
GO

/****** Object:  Database TCCECA    Script Date: 17.11.2014 16:06:15 ******/



IF EXISTS(select * from sys.databases where name='TCCECA')
BEGIN
ALTER DATABASE TCCECA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE TCCECA
END

CREATE DATABASE TCCECA
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TCCECA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TCCECA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TCCECA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TCCECA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE TCCECA SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC TCCECA.dbo.sp_fulltext_database @action = 'enable'
end
GO

ALTER DATABASE TCCECA SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE TCCECA SET ANSI_NULLS OFF 
GO

ALTER DATABASE TCCECA SET ANSI_PADDING OFF 
GO

ALTER DATABASE TCCECA SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE TCCECA SET ARITHABORT OFF 
GO

ALTER DATABASE TCCECA SET AUTO_CLOSE OFF 
GO

ALTER DATABASE TCCECA SET AUTO_SHRINK OFF 
GO

ALTER DATABASE TCCECA SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE TCCECA SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE TCCECA SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE TCCECA SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE TCCECA SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE TCCECA SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE TCCECA SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE TCCECA SET  DISABLE_BROKER 
GO

ALTER DATABASE TCCECA SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE TCCECA SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE TCCECA SET TRUSTWORTHY OFF 
GO

ALTER DATABASE TCCECA SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE TCCECA SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE TCCECA SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE TCCECA SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE TCCECA SET RECOVERY FULL 
GO

ALTER DATABASE TCCECA SET  MULTI_USER 
GO

ALTER DATABASE TCCECA SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE TCCECA SET DB_CHAINING OFF 
GO

ALTER DATABASE TCCECA SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE TCCECA SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE TCCECA SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE TCCECA SET  READ_WRITE 
GO






USE TCCECA
GO

/****** Object:  Table dbo.roles    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.roles(
	idrole int NOT NULL IDENTITY,
	name varchar(45) NOT NULL,
 CONSTRAINT PK_idrole PRIMARY KEY CLUSTERED 
(
	[idrole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




USE TCCECA
GO

/****** Object:  Table dbo.status    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.status(
	idstatus int NOT NULL IDENTITY,
	name varchar(45) NOT NULL,
 CONSTRAINT PK_idstatus PRIMARY KEY CLUSTERED 
(
	[idstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO





USE TCCECA
GO

/****** Object:  Table dbo.addresses    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.addresses(
	idaddress int NOT NULL IDENTITY,
	street varchar(60) NOT NULL,
	housenumber varchar(45) NOT NULL,
	npa int NOT NULL,
	city varchar(45) NOT NULL,
 CONSTRAINT PK_idaddress PRIMARY KEY CLUSTERED 
(
	[idaddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO






USE TCCECA
GO

/****** Object:  Table dbo.seasons    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.seasons(
	idseason int NOT NULL IDENTITY,
	name varchar(45) NOT NULL,
	startdate DATE NOT NULL,
	enddate DATE NOT NULL,
 CONSTRAINT PK_idseason PRIMARY KEY CLUSTERED 
(
	[idseason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




USE TCCECA
GO

/****** Object:  Table dbo.courts    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.courts(
	idcourt int NOT NULL IDENTITY,
	name varchar(45) NOT NULL,
	consultationdays INT NOT NULL,
 CONSTRAINT PK_idcourt PRIMARY KEY CLUSTERED 
(
	[idcourt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO






USE TCCECA
GO

/****** Object:  Table dbo.parameters    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.parameters(
	idparameters int NOT NULL IDENTITY,
	graceperiod INT NOT NULL,
	courtregistrationstarttime TIME NOT NULL,
	courtregistrationendtime TIME NOT NULL,
	externreservationdays INT NOT NULL,
 CONSTRAINT PK_idparameters PRIMARY KEY CLUSTERED 
(
	[idparameters] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE TCCECA
GO

/****** Object:  Table dbo.registationstatus    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.registationstatus(
	idregistationstatus int NOT NULL IDENTITY,
	name VARCHAR(45) NOT NULL,
 CONSTRAINT PK_idregistationstatus PRIMARY KEY CLUSTERED 
(
	[idregistationstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table dbo.group    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.groupe(
	idgroupe int NOT NULL IDENTITY,
	name VARCHAR(45) NOT NULL,
 CONSTRAINT PK_groupe PRIMARY KEY CLUSTERED 
(
	idgroupe ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO







USE TCCECA
GO

/****** Object:  Table dbo.users    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.users(
	iduser int NOT NULL IDENTITY,
	username VARCHAR(45) NOT NULL,
	password VARCHAR(60) NULL,
	firstname VARCHAR(45) NOT NULL,
	lastname VARCHAR(45) NOT NULL,
	email VARCHAR(60) NOT NULL,
	fkaddress INT NOT NULL,
	fkrole INT NOT NULL,
	invitation INT NOT NULL,
	fkstatus INT NOT NULL,
	name VARCHAR(45) NOT NULL,
	active INT NOT NULL,
	valid INT NOT NULL,
	fkgroupe INT NULL,
 CONSTRAINT PK_iduser PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE dbo.users
	ADD CONSTRAINT fk_Users_roles
	FOREIGN KEY (fkrole) REFERENCES dbo.roles(idrole) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.users
	ADD CONSTRAINT fk_Users_addresses
	FOREIGN KEY (fkaddress) REFERENCES dbo.addresses(idaddress) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.users
	ADD CONSTRAINT fk_Users_status
	FOREIGN KEY (fkstatus) REFERENCES dbo.status(idstatus) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.users
	ADD CONSTRAINT fk_Users_username_unique UNIQUE(username);
GO

ALTER TABLE dbo.users
	ADD CONSTRAINT fk_Users_groupe
	FOREIGN KEY (fkgroupe) REFERENCES dbo.groupe(idgroupe) ON DELETE SET NULL /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO













USE TCCECA
GO

/****** Object:  Table dbo.registrations    Script Date: 17.11.2014 16:15:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.registrations(
	idregistration int NOT NULL IDENTITY,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	fkcourt INT NOT NULL,
	fktaker INT NULL,
	fkpartenaire INT NULL,
	firstnamepartner VARCHAR(45) NULL,
	lastnamepartner VARCHAR(45) NULL,
	firstnametaker VARCHAR(45) NULL,
	lastnametaker VARCHAR(45) NULL,
	fkaddress INT NULL,
	emailtaker VARCHAR(60) NULL,
	tokenaddtaker VARCHAR(60) NULL,
	tokendeletetaker VARCHAR(60) NULL,
	status INT NULL,
	tokenaddexpirationdate VARCHAR(60) NULL,
	tokendeleteexpirationdate VARCHAR(60) NULL,
	startdate DATE NOT NULL,
	enddate DATE NOT NULL,
	recurring INT NOT NULL,
	paid INT NOT NULL,
 CONSTRAINT PK_idregistration PRIMARY KEY CLUSTERED 
(
	idregistration ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE dbo.registrations
	ADD CONSTrAINT fk_registrations_courts
	FOREIGN KEY (fkcourt) REFERENCES dbo.courts(idcourt) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO


ALTER TABLE dbo.registrations
	ADD CONSTrAINT fk_registrations_Taker
	FOREIGN KEY (fktaker) REFERENCES dbo.Users(iduser) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.registrations
	ADD CONSTrAINT fk_registrations_Partner
	FOREIGN KEY (fkpartenaire) REFERENCES dbo.Users(iduser) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.registrations
	ADD CONSTrAINT fk_registrations_RegistrationStatus
	FOREIGN KEY (status) REFERENCES dbo.registationstatus(idregistationstatus) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.registrations
	ADD CONSTrAINT fk_registrations_Address
	FOREIGN KEY (fkaddress) REFERENCES dbo.addresses(idaddress) ON DELETE NO ACTION /*NO ACTION / CASCADE / SET NULL / SET DEFAULT*/
GO

ALTER TABLE dbo.registrations
	ADD CONSTRAINT startdate CHECK (startdate > GetDate() );
GO

ALTER TABLE dbo.registrations
	ADD CONSTRAINT startdateOneMonth CHECK (startdate < DATEADD(mm,1,GetDate()) );
GO

ALTER TABLE dbo.registrations
	ADD CONSTRAINT enddate CHECK (enddate >= startdate );
GO



use TCCECA;

insert into addresses (street, housenumber, npa, city) values ('Cynthia', 'Mccoy', 1296, 'Sernovodsk');
insert into addresses (street, housenumber, npa, city) values ('Keith', 'Jacobs', 1195, 'Pingtan');
insert into addresses (street, housenumber, npa, city) values ('Timothy', 'Carpenter', 1079, 'Dzhalka');
insert into addresses (street, housenumber, npa, city) values ('Theresa', 'Watkins', 1701, 'Uralo-Kavkaz');
insert into addresses (street, housenumber, npa, city) values ('Adam', 'Stone', 1363, 'Likiep');
insert into addresses (street, housenumber, npa, city) values ('Kathy', 'Butler', 1944, 'Perth');
insert into addresses (street, housenumber, npa, city) values ('Wayne', 'Hart', 1390, 'Saint-Laurent-du-Var');
insert into addresses (street, housenumber, npa, city) values ('Douglas', 'Johnson', 1896, 'Yinjiang');
insert into addresses (street, housenumber, npa, city) values ('Clarence', 'Alexander', 1544, 'Cañete');
insert into addresses (street, housenumber, npa, city) values ('Lois', 'Cruz', 1736, 'Maramag');
insert into addresses (street, housenumber, npa, city) values ('Bonnie', 'Stevens', 1644, 'Xinglongchang');
insert into addresses (street, housenumber, npa, city) values ('Gary', 'Berry', 1110, 'Xinjian');
insert into addresses (street, housenumber, npa, city) values ('Earl', 'Mccoy', 1437, 'Taboc');
insert into addresses (street, housenumber, npa, city) values ('Paula', 'Wheeler', 1679, 'Laugar');
insert into addresses (street, housenumber, npa, city) values ('Craig', 'Brown', 1689, 'Heshan');
insert into addresses (street, housenumber, npa, city) values ('Frank', 'Day', 1968, 'Horní Bříza');
insert into addresses (street, housenumber, npa, city) values ('Martin', 'Stewart', 1556, 'Yanac');
insert into addresses (street, housenumber, npa, city) values ('Frank', 'Hunter', 1371, 'Retorta');
insert into addresses (street, housenumber, npa, city) values ('Charles', 'Perez', 1555, 'Esperanza');
insert into addresses (street, housenumber, npa, city) values ('Emily', 'Lynch', 1097, 'Askersund');
insert into addresses (street, housenumber, npa, city) values ('Rose', 'Hudson', 1804, 'Ruo');
insert into addresses (street, housenumber, npa, city) values ('Roger', 'Davis', 1194, 'Rettikhovka');
insert into addresses (street, housenumber, npa, city) values ('Bruce', 'Austin', 1628, 'Łęki Szlacheckie');
insert into addresses (street, housenumber, npa, city) values ('Antonio', 'Scott', 1118, 'Haodian');
insert into addresses (street, housenumber, npa, city) values ('Todd', 'Mcdonald', 1776, 'Houbai');
insert into addresses (street, housenumber, npa, city) values ('Brenda', 'Kelly', 1020, 'Voskhod');
insert into addresses (street, housenumber, npa, city) values ('Mark', 'Gardner', 1290, 'Salegading');
insert into addresses (street, housenumber, npa, city) values ('Roger', 'Evans', 1268, 'Dongqianhu');
insert into addresses (street, housenumber, npa, city) values ('Ronald', 'Perez', 1924, 'Semampirbarat');
insert into addresses (street, housenumber, npa, city) values ('Ernest', 'Romero', 1657, 'Kupino');
insert into addresses (street, housenumber, npa, city) values ('Robin', 'Ramirez', 1991, 'Keleleng');
insert into addresses (street, housenumber, npa, city) values ('Jesse', 'Mitchell', 1447, 'Santa Cruz');
insert into addresses (street, housenumber, npa, city) values ('Harry', 'George', 1932, 'Levin');
insert into addresses (street, housenumber, npa, city) values ('Charles', 'Harrison', 1389, 'Mölndal');
insert into addresses (street, housenumber, npa, city) values ('Albert', 'Lawson', 1390, 'Szynwałd');
insert into addresses (street, housenumber, npa, city) values ('Terry', 'Rivera', 1698, 'Agua Blanca');
insert into addresses (street, housenumber, npa, city) values ('Alice', 'Reyes', 1965, 'Nossa Senhora do Socorro');
insert into addresses (street, housenumber, npa, city) values ('Anne', 'Rivera', 1978, 'Banjar Penyalin');
insert into addresses (street, housenumber, npa, city) values ('Lois', 'Carroll', 1758, 'Būr Safājah');
insert into addresses (street, housenumber, npa, city) values ('Christopher', 'James', 1636, 'El Paso');
insert into addresses (street, housenumber, npa, city) values ('Randy', 'Daniels', 1819, 'Ryōtsu-minato');
insert into addresses (street, housenumber, npa, city) values ('Mildred', 'Wood', 1457, 'Santa Cruz');
insert into addresses (street, housenumber, npa, city) values ('Linda', 'Jackson', 1049, 'Maisons-Laffitte');
insert into addresses (street, housenumber, npa, city) values ('Diane', 'Sanchez', 1478, 'Ierápetra');
insert into addresses (street, housenumber, npa, city) values ('Eugene', 'Lawrence', 1854, 'Karangbalong');
insert into addresses (street, housenumber, npa, city) values ('Jason', 'Garza', 1849, 'Warin Chamrap');
insert into addresses (street, housenumber, npa, city) values ('Anthony', 'Ray', 1238, 'Kara');
insert into addresses (street, housenumber, npa, city) values ('Sharon', 'Robertson', 1058, 'Takeshiken');
insert into addresses (street, housenumber, npa, city) values ('Clarence', 'Cox', 1879, 'Hesheng');
insert into addresses (street, housenumber, npa, city) values ('Barbara', 'Richards', 1280, 'Chivor');
insert into addresses (street, housenumber, npa, city) values ('Angela', 'Carter', 1688, 'Huazhu');
insert into addresses (street, housenumber, npa, city) values ('Tammy', 'Peterson', 1331, 'Mongu');
insert into addresses (street, housenumber, npa, city) values ('Louis', 'Hayes', 1499, 'Jinshan');
insert into addresses (street, housenumber, npa, city) values ('Brandon', 'Flores', 1521, 'Cibitung');
insert into addresses (street, housenumber, npa, city) values ('Martha', 'Burns', 1824, 'Lanchkhuti');
insert into addresses (street, housenumber, npa, city) values ('Emily', 'Williamson', 1303, 'Kommunar');
insert into addresses (street, housenumber, npa, city) values ('Benjamin', 'Harvey', 1004, 'Manoc-Manoc');
insert into addresses (street, housenumber, npa, city) values ('Benjamin', 'Reed', 1057, 'Bolanon');
insert into addresses (street, housenumber, npa, city) values ('Jonathan', 'Anderson', 1815, 'Saint-Maurice');
insert into addresses (street, housenumber, npa, city) values ('Richard', 'Hayes', 1927, 'Ansheng');
insert into addresses (street, housenumber, npa, city) values ('Angela', 'Garrett', 1983, 'Umuahia');
insert into addresses (street, housenumber, npa, city) values ('Jose', 'Mcdonald', 1740, 'Uychi');
insert into addresses (street, housenumber, npa, city) values ('Annie', 'Vasquez', 1800, 'Ijebu-Ife');
insert into addresses (street, housenumber, npa, city) values ('Steven', 'Kim', 1673, 'Xinshui');
insert into addresses (street, housenumber, npa, city) values ('Emily', 'Bradley', 1886, 'Salt Lake City');
insert into addresses (street, housenumber, npa, city) values ('Joan', 'Gardner', 1575, 'Tlogocilik');
insert into addresses (street, housenumber, npa, city) values ('Raymond', 'Oliver', 1017, 'Shatrovo');
insert into addresses (street, housenumber, npa, city) values ('Walter', 'Taylor', 1862, 'Orangeville');
insert into addresses (street, housenumber, npa, city) values ('Amy', 'Ferguson', 1748, 'Takahata');
insert into addresses (street, housenumber, npa, city) values ('Marilyn', 'Gonzalez', 1760, 'Neftçala');
insert into addresses (street, housenumber, npa, city) values ('Barbara', 'Hughes', 1528, 'Błażowa');
insert into addresses (street, housenumber, npa, city) values ('George', 'Allen', 1280, 'Klatovy');
insert into addresses (street, housenumber, npa, city) values ('Arthur', 'Fisher', 1404, 'Bayasgalant');
insert into addresses (street, housenumber, npa, city) values ('Eugene', 'Kelly', 1845, 'Jenang Selatan');
insert into addresses (street, housenumber, npa, city) values ('Sean', 'Phillips', 1664, 'Kasulu');
insert into addresses (street, housenumber, npa, city) values ('Dennis', 'Day', 1715, 'Tongshan');
insert into addresses (street, housenumber, npa, city) values ('Russell', 'James', 1845, 'Sikur');
insert into addresses (street, housenumber, npa, city) values ('Anne', 'Rose', 1395, 'Savski Venac');
insert into addresses (street, housenumber, npa, city) values ('Tammy', 'Evans', 1092, 'Nice');
insert into addresses (street, housenumber, npa, city) values ('Edward', 'Owens', 1720, 'Huanglong');
insert into addresses (street, housenumber, npa, city) values ('Laura', 'Kelly', 1699, 'Matelândia');
insert into addresses (street, housenumber, npa, city) values ('Philip', 'Crawford', 1732, 'Tuapse');
insert into addresses (street, housenumber, npa, city) values ('Phyllis', 'Harris', 1179, 'Marneuli');
insert into addresses (street, housenumber, npa, city) values ('Karen', 'Henry', 1615, 'Ismailia');
insert into addresses (street, housenumber, npa, city) values ('Phyllis', 'Vasquez', 1601, 'Stockholm');
insert into addresses (street, housenumber, npa, city) values ('Annie', 'Green', 1771, 'Akropong');
insert into addresses (street, housenumber, npa, city) values ('Carol', 'Gibson', 1826, 'Luoshan');
insert into addresses (street, housenumber, npa, city) values ('Donna', 'Brooks', 1469, 'Rungis');
insert into addresses (street, housenumber, npa, city) values ('Christopher', 'Austin', 1883, 'Mursaba');
insert into addresses (street, housenumber, npa, city) values ('Phillip', 'Rogers', 1778, 'Lysá nad Labem');
insert into addresses (street, housenumber, npa, city) values ('Roger', 'Marshall', 1503, 'Konstantynów Łódzki');
insert into addresses (street, housenumber, npa, city) values ('Willie', 'Morris', 1057, 'Nanfeng');
insert into addresses (street, housenumber, npa, city) values ('Jean', 'Phillips', 1099, 'Heshan');
insert into addresses (street, housenumber, npa, city) values ('Ruby', 'Turner', 1119, 'Tubarão');
insert into addresses (street, housenumber, npa, city) values ('Bruce', 'Watson', 1234, 'Lidköping');
insert into addresses (street, housenumber, npa, city) values ('Henry', 'Watkins', 1519, 'Kampong Thom');
insert into addresses (street, housenumber, npa, city) values ('Barbara', 'Frazier', 1575, 'La Peña');
insert into addresses (street, housenumber, npa, city) values ('Stephanie', 'Edwards', 1864, 'Pringu');
insert into addresses (street, housenumber, npa, city) values ('Todd', 'Berry', 1281, 'San Miguel');
insert into addresses (street, housenumber, npa, city) values ('Carlos', 'Kelly', 1362, 'Wincrange');
insert into addresses (street, housenumber, npa, city) values ('Richard', 'Cook', 1639, 'Záhorovice');
insert into addresses (street, housenumber, npa, city) values ('Carlos', 'Moore', 1707, 'Seget');
insert into addresses (street, housenumber, npa, city) values ('Anne', 'Hicks', 1426, 'Peliyagoda');
insert into addresses (street, housenumber, npa, city) values ('Fred', 'Graham', 1091, 'Longquan');
insert into addresses (street, housenumber, npa, city) values ('Phyllis', 'Duncan', 1387, 'Ponggok');
insert into addresses (street, housenumber, npa, city) values ('Keith', 'Nguyen', 1026, 'Dongle');
insert into addresses (street, housenumber, npa, city) values ('Henry', 'Smith', 1099, 'Bantarpanjang');
insert into addresses (street, housenumber, npa, city) values ('Patricia', 'Smith', 1325, 'Arcachon');
insert into addresses (street, housenumber, npa, city) values ('Julia', 'Woods', 1763, 'Kyurdarmir');
insert into addresses (street, housenumber, npa, city) values ('David', 'Roberts', 1611, 'Ambelókipoi');
insert into addresses (street, housenumber, npa, city) values ('Christopher', 'Jenkins', 1070, 'Pulap');
insert into addresses (street, housenumber, npa, city) values ('Amanda', 'Berry', 1328, 'Nueva Arica');
insert into addresses (street, housenumber, npa, city) values ('Thomas', 'George', 1879, 'Wuquan');
insert into addresses (street, housenumber, npa, city) values ('Albert', 'Williams', 1413, 'Litian');
insert into addresses (street, housenumber, npa, city) values ('Jeffrey', 'Schmidt', 1871, 'Wodzierady');
insert into addresses (street, housenumber, npa, city) values ('Carlos', 'Baker', 1791, 'Limushan');
insert into addresses (street, housenumber, npa, city) values ('Jean', 'Hicks', 1858, 'Babakansari');
insert into addresses (street, housenumber, npa, city) values ('Marie', 'Cook', 1196, 'Milín');
insert into addresses (street, housenumber, npa, city) values ('Steve', 'Rodriguez', 1291, 'Qalqīlyah');
insert into addresses (street, housenumber, npa, city) values ('Joe', 'Thomas', 1149, 'Lyon');
insert into addresses (street, housenumber, npa, city) values ('Thomas', 'Jenkins', 1707, 'Nikol’sk');
insert into addresses (street, housenumber, npa, city) values ('Debra', 'Torres', 1511, 'Saint-Julien-en-Genevois');
insert into addresses (street, housenumber, npa, city) values ('Paul', 'Smith', 1959, 'Kiambu');
insert into addresses (street, housenumber, npa, city) values ('Margaret', 'Wood', 1946, 'Keleng');
insert into addresses (street, housenumber, npa, city) values ('Kenneth', 'Armstrong', 1552, 'Cogtong');
insert into addresses (street, housenumber, npa, city) values ('Paul', 'Crawford', 1918, 'Toledo');
insert into addresses (street, housenumber, npa, city) values ('Kathy', 'Perry', 1778, 'Potet');
insert into addresses (street, housenumber, npa, city) values ('Steve', 'Rose', 1927, 'Ţūbās');
insert into addresses (street, housenumber, npa, city) values ('Jerry', 'Harvey', 1274, 'Qŭrghonteppa');
insert into addresses (street, housenumber, npa, city) values ('Roger', 'Johnston', 1777, 'Katuli');
insert into addresses (street, housenumber, npa, city) values ('Jack', 'Ramos', 1733, 'Ljungby');
insert into addresses (street, housenumber, npa, city) values ('Rachel', 'Phillips', 1283, 'Mancogeh');
insert into addresses (street, housenumber, npa, city) values ('Richard', 'Banks', 1437, 'Xinjiezi');
insert into addresses (street, housenumber, npa, city) values ('Phyllis', 'Grant', 1075, 'Vila Alva');
insert into addresses (street, housenumber, npa, city) values ('Benjamin', 'Peters', 1860, 'Örbyhus');
insert into addresses (street, housenumber, npa, city) values ('Joseph', 'Jackson', 1611, 'Chonchi');
insert into addresses (street, housenumber, npa, city) values ('Kathy', 'Hart', 1764, 'Phichit');
insert into addresses (street, housenumber, npa, city) values ('Arthur', 'Richardson', 1918, 'Bangkalan');
insert into addresses (street, housenumber, npa, city) values ('Ann', 'Crawford', 1351, 'Casilda');
insert into addresses (street, housenumber, npa, city) values ('Jimmy', 'Knight', 1218, 'Mokotów');
insert into addresses (street, housenumber, npa, city) values ('Melissa', 'Vasquez', 1651, 'Garahaji');
insert into addresses (street, housenumber, npa, city) values ('Carlos', 'Duncan', 1978, 'Dalongzhan');
insert into addresses (street, housenumber, npa, city) values ('Annie', 'Turner', 1918, 'Chowki Jamali');
insert into addresses (street, housenumber, npa, city) values ('Cynthia', 'Warren', 1143, 'San Pedro');
insert into addresses (street, housenumber, npa, city) values ('George', 'Banks', 1027, 'Wamba');
insert into addresses (street, housenumber, npa, city) values ('Gregory', 'Riley', 1730, 'Gangkou');
insert into addresses (street, housenumber, npa, city) values ('Jeremy', 'Vasquez', 1286, 'Cajolá');
insert into addresses (street, housenumber, npa, city) values ('Harry', 'Torres', 1234, 'Suraż');
insert into addresses (street, housenumber, npa, city) values ('Bruce', 'Ross', 1775, 'Křenovice');
insert into addresses (street, housenumber, npa, city) values ('Helen', 'Allen', 1009, 'Acobambilla');
insert into addresses (street, housenumber, npa, city) values ('Lori', 'Gilbert', 1597, 'Cezi');
insert into addresses (street, housenumber, npa, city) values ('Adam', 'Perry', 1549, 'Wangshi');
insert into addresses (street, housenumber, npa, city) values ('Fred', 'Welch', 1055, 'Lijiang');
insert into addresses (street, housenumber, npa, city) values ('Betty', 'Oliver', 1136, 'Songkhla');
insert into addresses (street, housenumber, npa, city) values ('Harold', 'Harvey', 1649, 'Voyskovitsy');
insert into addresses (street, housenumber, npa, city) values ('Ryan', 'Myers', 1689, 'El Cafetal');
insert into addresses (street, housenumber, npa, city) values ('Michael', 'Payne', 1115, 'Jiaotan');
insert into addresses (street, housenumber, npa, city) values ('Steve', 'Gardner', 1608, 'Krajan Waturoyo');
insert into addresses (street, housenumber, npa, city) values ('Anthony', 'Palmer', 1115, 'Kedungringin');
insert into addresses (street, housenumber, npa, city) values ('Jeffrey', 'Richardson', 1150, 'Gaoping');
insert into addresses (street, housenumber, npa, city) values ('Christina', 'Woods', 1891, 'São João del Rei');
insert into addresses (street, housenumber, npa, city) values ('Evelyn', 'Garrett', 1414, 'Huertas');
insert into addresses (street, housenumber, npa, city) values ('Lillian', 'Morgan', 1314, 'Zhifudao');
insert into addresses (street, housenumber, npa, city) values ('Mary', 'Nelson', 1671, 'Vashkivtsi');
insert into addresses (street, housenumber, npa, city) values ('Paula', 'Watkins', 1272, 'Itapipoca');
insert into addresses (street, housenumber, npa, city) values ('Kevin', 'Phillips', 1855, 'Buenavista');
insert into addresses (street, housenumber, npa, city) values ('Susan', 'Fuller', 1385, 'Kisela Voda');
insert into addresses (street, housenumber, npa, city) values ('Jonathan', 'Robinson', 1100, 'Rízoma');
insert into addresses (street, housenumber, npa, city) values ('Louis', 'Riley', 1933, 'Osiek');
insert into addresses (street, housenumber, npa, city) values ('Helen', 'Cole', 1226, 'Kawanoechō');
insert into addresses (street, housenumber, npa, city) values ('Justin', 'Turner', 1614, 'Dacheng');
insert into addresses (street, housenumber, npa, city) values ('Louise', 'Morales', 1519, 'Plateliai');
insert into addresses (street, housenumber, npa, city) values ('Fred', 'Cunningham', 1947, 'Carrazeda de Ansiães');
insert into addresses (street, housenumber, npa, city) values ('Bruce', 'Weaver', 1489, 'Couço');
insert into addresses (street, housenumber, npa, city) values ('Evelyn', 'Baker', 1471, 'La Condamine');
insert into addresses (street, housenumber, npa, city) values ('Jessica', 'Henry', 1815, 'Patnongon');
insert into addresses (street, housenumber, npa, city) values ('Albert', 'Kelly', 1947, 'Cikaras');
insert into addresses (street, housenumber, npa, city) values ('Peter', 'Johnston', 1393, 'Kiupo');
insert into addresses (street, housenumber, npa, city) values ('Gloria', 'Edwards', 1551, 'Thanh Ba');
insert into addresses (street, housenumber, npa, city) values ('Lois', 'Robinson', 1539, 'Stockholm');
insert into addresses (street, housenumber, npa, city) values ('Ruby', 'Clark', 1778, 'Qianjin');
insert into addresses (street, housenumber, npa, city) values ('Phyllis', 'Carter', 1372, 'Troyes');
insert into addresses (street, housenumber, npa, city) values ('Martha', 'Diaz', 1499, 'Atambua');
insert into addresses (street, housenumber, npa, city) values ('Bobby', 'Baker', 1272, 'Lindome');
insert into addresses (street, housenumber, npa, city) values ('Jose', 'Daniels', 1655, 'Carmo do Cajuru');
insert into addresses (street, housenumber, npa, city) values ('Dennis', 'Long', 1466, 'Bandaragung');
insert into addresses (street, housenumber, npa, city) values ('Jessica', 'Henderson', 1059, 'Guanba');
insert into addresses (street, housenumber, npa, city) values ('Rose', 'Alvarez', 1027, 'Francisco I Madero');
insert into addresses (street, housenumber, npa, city) values ('Kelly', 'Peterson', 1690, 'Korsun’-Shevchenkivs’kyy');
insert into addresses (street, housenumber, npa, city) values ('Steven', 'Montgomery', 1713, 'Anahawan');
insert into addresses (street, housenumber, npa, city) values ('Aaron', 'Wright', 1281, 'Datangzhuang');
insert into addresses (street, housenumber, npa, city) values ('Antonio', 'Little', 1787, 'Osekovo');
insert into addresses (street, housenumber, npa, city) values ('Todd', 'Matthews', 1019, 'Tegalgede');
insert into addresses (street, housenumber, npa, city) values ('Laura', 'Griffin', 1992, 'Yongqin');
insert into addresses (street, housenumber, npa, city) values ('James', 'Spencer', 1269, 'Chiri-Yurt');
insert into addresses (street, housenumber, npa, city) values ('James', 'Larson', 1501, 'Panyam');
insert into addresses (street, housenumber, npa, city) values ('Michael', 'Shaw', 1949, 'Burayevo');
insert into addresses (street, housenumber, npa, city) values ('Albert', 'Snyder', 1222, 'Plottier');
insert into addresses (street, housenumber, npa, city) values ('Jane', 'Alexander', 1260, 'Fovissste');
insert into addresses (street, housenumber, npa, city) values ('Katherine', 'Anderson', 1999, 'Banjar Banyualit');

insert into roles (name) values ('Administrateur');
insert into roles (name) values ('Utilisateur');

insert into status (name) values ('');
insert into status (name) values ('');

insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bobby Mccoy', 'Jean', 'Burton', 'bmccoy0@go.com', 24, 1, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gary Nguyen', 'Louise', 'Fernandez', 'gnguyen1@who.int', 104, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Teresa Welch', 'Rose', 'Vasquez', 'twelch2@geocities.com', 37, 2, 1, 2, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Harry Brooks', 'Lois', 'Hill', 'hbrooks3@tripod.com', 130, 2, 1, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Randy Hernandez', 'Ashley', 'Myers', 'rhernandez4@narod.ru', 88, 2, 0, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Steven Snyder', 'Kathy', 'Moreno', 'ssnyder5@comcast.net', 170, 2, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jeremy Diaz', 'Peter', 'Fields', 'jdiaz6@spotify.com', 133, 1, 0, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jennifer Ward', 'Johnny', 'Garcia', 'jward7@angelfire.com', 99, 2, 0, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kimberly Butler', 'Carol', 'Andrews', 'kbutler8@canalblog.com', 39, 1, 1, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Alice Kelly', 'Todd', 'Ramos', 'akelly9@ow.ly', 55, 2, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jimmy Rogers', 'Shawn', 'Johnson', 'jrogersa@nsw.gov.au', 66, 1, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Margaret West', 'Jeremy', 'Banks', 'mwestb@craigslist.org', 119, 2, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Norma Vasquez', 'Joe', 'Clark', 'nvasquezc@biglobe.ne.jp', 62, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Susan Morris', 'Jose', 'Mcdonald', 'smorrisd@theglobeandmail.com', 66, 2, 0, 2, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sara Medina', 'Bruce', 'Ellis', 'smedinae@cafepress.com', 145, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Anthony Schmidt', 'Janet', 'Edwards', 'aschmidtf@google.cn', 163, 1, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Louise Robinson', 'Angela', 'Bailey', 'lrobinsong@vimeo.com', 36, 2, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ann Ferguson', 'Katherine', 'Wallace', 'afergusonh@google.co.uk', 2, 2, 0, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lois Garza', 'Ashley', 'Owens', 'lgarzai@home.pl', 88, 1, 1, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kevin Richards', 'Michael', 'Bishop', 'krichardsj@seattletimes.com', 109, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Laura Elliott', 'Shawn', 'Robinson', 'lelliottk@about.me', 40, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Edward Berry', 'Willie', 'Gibson', 'eberryl@cargocollective.com', 68, 2, 1, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Wanda Gordon', 'Phillip', 'Webb', 'wgordonm@themeforest.net', 131, 2, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Martha Wagner', 'Jacqueline', 'Matthews', 'mwagnern@springer.com', 7, 2, 1, 2, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Louise Powell', 'Matthew', 'Murray', 'lpowello@delicious.com', 108, 2, 0, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Brian Carter', 'James', 'Hawkins', 'bcarterp@msn.com', 77, 2, 1, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Betty Sanchez', 'Ralph', 'Ross', 'bsanchezq@ft.com', 18, 2, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('John Jacobs', 'Jimmy', 'Vasquez', 'jjacobsr@google.com.br', 100, 2, 0, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Walter Hawkins', 'Roger', 'Jordan', 'whawkinss@taobao.com', 187, 2, 0, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Joan Stevens', 'Ryan', 'Hughes', 'jstevenst@themeforest.net', 65, 2, 1, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Beverly Banks', 'Louise', 'Pierce', 'bbanksu@princeton.edu', 95, 1, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Joan Stevens2', 'Debra', 'Brooks', 'jstevensv@va.gov', 120, 2, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Andrea Myers', 'Tammy', 'Marshall', 'amyersw@independent.co.uk', 155, 2, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Theresa Allen', 'Christina', 'Chapman', 'tallenx@chicagotribune.com', 32, 2, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Scott Stephens', 'Joshua', 'Lynch', 'sstephensy@smh.com.au', 109, 1, 1, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lawrence Hunter', 'Ann', 'Smith', 'lhunterz@latimes.com', 31, 2, 1, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Brandon Allen', 'Rebecca', 'Parker', 'ballen10@google.ca', 120, 2, 1, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Laura Harrison', 'Pamela', 'Hunt', 'lharrison11@senate.gov', 73, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bonnie Hamilton', 'Tina', 'Harper', 'bhamilton12@wp.com', 188, 2, 1, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Evelyn Austin', 'Kelly', 'Watkins', 'eaustin13@tripod.com', 61, 2, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Wayne Gordon', 'Susan', 'Daniels', 'wgordon14@mlb.com', 115, 2, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Johnny Moore', 'Marie', 'Hart', 'jmoore15@upenn.edu', 119, 1, 1, 2, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Roy Freeman', 'Phillip', 'Sullivan', 'rfreeman16@princeton.edu', 184, 1, 1, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Evelyn Williamson', 'Henry', 'Ramos', 'ewilliamson17@sogou.com', 24, 2, 0, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Douglas Hughes', 'Paul', 'Marshall', 'dhughes18@mac.com', 44, 2, 0, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Julia Chavez', 'Christopher', 'Berry', 'jchavez19@wikispaces.com', 187, 2, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Nancy Thomas', 'Lori', 'Gardner', 'nthomas1a@omniture.com', 138, 1, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Stephen Duncan', 'Julia', 'Griffin', 'sduncan1b@mapquest.com', 12, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Michael Burns', 'Paul', 'Payne', 'mburns1c@google.fr', 53, 1, 1, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lori Anderson', 'Judy', 'Reed', 'landerson1d@dion.ne.jp', 56, 1, 0, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Christine West', 'Alan', 'Knight', 'cwest1e@over-blog.com', 9, 2, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Pamela Lawson', 'Adam', 'Phillips', 'plawson1f@gizmodo.com', 99, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Johnny Mendoza', 'Henry', 'Franklin', 'jmendoza1g@topsy.com', 28, 2, 1, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jessica Garcia', 'Betty', 'Wheeler', 'jgarcia1h@livejournal.com', 172, 2, 0, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jesse Burton', 'Lillian', 'Nelson', 'jburton1i@comcast.net', 2, 2, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jerry Lynch', 'Jack', 'Gutierrez', 'jlynch1j@hud.gov', 12, 1, 0, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Mary Collins', 'Judith', 'Williams', 'mcollins1k@slideshare.net', 1, 1, 1, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Beverly Hicks', 'Mildred', 'Porter', 'bhicks1l@sbwire.com', 181, 2, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Craig Miller', 'Katherine', 'Bailey', 'cmiller1m@macromedia.com', 160, 2, 0, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lisa Cunningham', 'Jose', 'Woods', 'lcunningham1n@tamu.edu', 9, 1, 0, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Edward Stevens', 'Keith', 'Watson', 'estevens1o@flickr.com', 128, 1, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Timothy Cooper', 'Steve', 'Jenkins', 'tcooper1p@sogou.com', 25, 1, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Harold Cooper', 'Martha', 'Allen', 'hcooper1q@cargocollective.com', 124, 1, 1, 1, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rachel Grant', 'Carlos', 'Tucker', 'rgrant1r@bing.com', 111, 1, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('William Dean', 'Earl', 'Mendoza', 'wdean1s@sciencedirect.com', 97, 1, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Katherine Hansen', 'Rachel', 'Price', 'khansen1t@gov.uk', 164, 2, 0, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Norma Wood', 'Samuel', 'Moreno', 'nwood1u@google.com', 68, 2, 0, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Earl Morgan', 'Brian', 'Jordan', 'emorgan1v@devhub.com', 15, 1, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Christine Castillo', 'Keith', 'Martin', 'ccastillo1w@independent.co.uk', 9, 1, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sarah Reed', 'Carlos', 'Ford', 'sreed1x@harvard.edu', 117, 2, 1, 2, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bruce Taylor', 'Sharon', 'Russell', 'btaylor1y@desdev.cn', 169, 2, 0, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Barbara Elliott', 'Shirley', 'Young', 'belliott1z@illinois.edu', 32, 2, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sharon Price', 'Eugene', 'Baker', 'sprice20@hatena.ne.jp', 64, 1, 0, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Anna Ortiz', 'George', 'Ruiz', 'aortiz21@goo.gl', 82, 2, 0, 2, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Laura Hayes', 'Barbara', 'Kennedy', 'lhayes22@scribd.com', 133, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gerald Perez', 'Christine', 'Clark', 'gperez23@spotify.com', 42, 2, 1, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kenneth Parker', 'Scott', 'Watson', 'kparker24@mac.com', 153, 1, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Karen Simmons', 'Carolyn', 'Lynch', 'ksimmons25@yahoo.com', 87, 1, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Martha Carroll', 'Kathryn', 'Perkins', 'mcarroll26@liveinternet.ru', 87, 1, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gary Alvarez', 'Ronald', 'Lewis', 'galvarez27@symantec.com', 71, 2, 0, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Anna Mccoy', 'Irene', 'Hamilton', 'amccoy28@plala.or.jp', 26, 1, 0, 2, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ryan Gonzales', 'Ashley', 'Nichols', 'rgonzales29@fema.gov', 179, 1, 1, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Randy Black', 'Denise', 'Stewart', 'rblack2a@whitehouse.gov', 117, 1, 0, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Russell Hicks', 'Joshua', 'Rogers', 'rhicks2b@latimes.com', 85, 1, 0, 2, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Victor Scott', 'Diane', 'Little', 'vscott2c@drupal.org', 151, 1, 0, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Cheryl Dunn', 'Larry', 'Cruz', 'cdunn2d@mit.edu', 49, 1, 0, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Eric Alvarez', 'Beverly', 'Knight', 'ealvarez2e@sitemeter.com', 54, 1, 1, 2, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Heather Tucker', 'Donna', 'Clark', 'htucker2f@goo.gl', 78, 1, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Clarence Bishop', 'Kimberly', 'Fisher', 'cbishop2g@wordpress.com', 83, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rebecca Carpenter', 'Alan', 'Hill', 'rcarpenter2h@quantcast.com', 85, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Catherine Campbell', 'Wanda', 'Arnold', 'ccampbell2i@oracle.com', 58, 1, 0, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Aaron Adams', 'Dorothy', 'Elliott', 'aadams2j@ft.com', 134, 1, 0, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sarah Palmer', 'Amanda', 'Allen', 'spalmer2k@mashable.com', 162, 2, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Daniel Chavez', 'Walter', 'Burke', 'dchavez2l@wikimedia.org', 120, 2, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Susan Burton', 'Tina', 'Burton', 'sburton2m@usa.gov', 62, 2, 1, 1, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rose Hanson', 'Gary', 'Hughes', 'rhanson2n@reuters.com', 100, 2, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bruce Bowman', 'Sandra', 'Price', 'bbowman2o@nba.com', 120, 2, 0, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Alan Carroll', 'Jean', 'Arnold', 'acarroll2p@ihg.com', 96, 1, 0, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Todd Frazier', 'Nancy', 'Stewart', 'tfrazier2q@whitehouse.gov', 73, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Joseph Turner', 'Anna', 'King', 'jturner2r@merriam-webster.com', 53, 2, 1, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('James Tucker', 'Julie', 'Grant', 'jtucker2s@globo.com', 54, 1, 1, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Louise Morrison', 'Tina', 'Wallace', 'lmorrison2t@stumbleupon.com', 95, 2, 0, 1, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Pamela Rivera', 'Jesse', 'Ramirez', 'privera2u@engadget.com', 144, 2, 1, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rose Flores', 'Donna', 'Turner', 'rflores2v@berkeley.edu', 74, 2, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lisa Cole', 'Robert', 'Campbell', 'lcole2w@eepurl.com', 187, 2, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Laura Carroll', 'Roy', 'Bailey', 'lcarroll2x@people.com.cn', 22, 2, 1, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Pamela Andrews', 'Shirley', 'Harper', 'pandrews2y@army.mil', 137, 2, 1, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Benjamin Powell', 'Dorothy', 'Butler', 'bpowell2z@newyorker.com', 172, 2, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jane Collins', 'Sara', 'Mason', 'jcollins30@cdc.gov', 187, 1, 0, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Benjamin Ruiz', 'Douglas', 'Powell', 'bruiz31@alexa.com', 158, 2, 1, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Julie Hunter', 'Thomas', 'Cunningham', 'jhunter32@ustream.tv', 41, 2, 0, 2, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gregory Meyer', 'Nancy', 'Payne', 'gmeyer33@booking.com', 87, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Phillip Ramirez', 'Jonathan', 'Richardson', 'pramirez34@apache.org', 102, 2, 0, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Douglas Rivera', 'Barbara', 'Robertson', 'drivera35@ftc.gov', 118, 2, 0, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Frank Hart', 'Sara', 'Chapman', 'fhart36@bravesites.com', 12, 2, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jimmy Peters', 'Joan', 'Howard', 'jpeters37@flavors.me', 162, 2, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Craig Allen', 'Wayne', 'Ferguson', 'callen38@wunderground.com', 39, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kathleen Sanders', 'Kathy', 'King', 'ksanders39@psu.edu', 176, 1, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Nancy Edwards', 'Martha', 'Sullivan', 'nedwards3a@de.vu', 177, 2, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ruby Fields', 'Pamela', 'Hamilton', 'rfields3b@reverbnation.com', 116, 2, 0, 2, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gregory Smith', 'Tammy', 'Bradley', 'gsmith3c@posterous.com', 111, 1, 1, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Howard Brown', 'Dennis', 'Allen', 'hbrown3d@taobao.com', 8, 2, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Charles Meyer', 'Charles', 'Montgomery', 'cmeyer3e@feedburner.com', 35, 1, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Joan Reyes', 'Debra', 'Banks', 'jreyes3f@senate.gov', 81, 1, 0, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Amanda Roberts', 'Evelyn', 'Gomez', 'aroberts3g@patch.com', 106, 1, 0, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Juan Long', 'Mary', 'Cooper', 'jlong3h@twitter.com', 1, 1, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Cynthia Cruz', 'Edward', 'Chapman', 'ccruz3i@example.com', 83, 1, 0, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Steve Peterson', 'Kathy', 'Snyder', 'speterson3j@pen.io', 171, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bruce Lopez', 'Wayne', 'Lee', 'blopez3k@fda.gov', 179, 2, 1, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kelly Mccoy', 'Eugene', 'Fox', 'kmccoy3l@elegantthemes.com', 177, 1, 1, 2, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Earl Sanders', 'Sandra', 'Bryant', 'esanders3m@studiopress.com', 118, 1, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Steven Chapman', 'Gloria', 'Torres', 'schapman3n@reddit.com', 97, 1, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Mary Ramirez', 'Brian', 'Armstrong', 'mramirez3o@woothemes.com', 21, 1, 1, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kathleen Sims', 'Annie', 'Baker', 'ksims3p@mysql.com', 7, 2, 1, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Scott Coleman', 'Paula', 'Long', 'scoleman3q@hatena.ne.jp', 105, 1, 0, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ruby Dixon', 'Jennifer', 'Graham', 'rdixon3r@gravatar.com', 4, 2, 0, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sara Coleman', 'Barbara', 'Clark', 'scoleman3s@joomla.org', 33, 1, 1, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Philip Griffin', 'Anne', 'Hill', 'pgriffin3t@cbsnews.com', 25, 1, 1, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('George Gutierrez', 'Louise', 'Holmes', 'ggutierrez3u@over-blog.com', 149, 2, 0, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kevin Webb', 'Craig', 'Oliver', 'kwebb3v@imageshack.us', 93, 1, 1, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Brandon James', 'Gerald', 'Webb', 'bjames3w@parallels.com', 147, 1, 1, 1, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sara Alexander', 'Karen', 'Sanders', 'salexander3x@clickbank.net', 103, 1, 1, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ralph Wagner', 'Heather', 'Gomez', 'rwagner3y@vkontakte.ru', 40, 2, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jose Hunt', 'Keith', 'Taylor', 'jhunt3z@rambler.ru', 141, 2, 0, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Irene Fields', 'Timothy', 'Griffin', 'ifields40@dagondesign.com', 27, 1, 0, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ernest Collins', 'Larry', 'West', 'ecollins41@1688.com', 162, 1, 1, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Joseph Clark', 'Heather', 'Wells', 'jclark42@scribd.com', 58, 2, 1, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Henry Hamilton', 'Lisa', 'Lawson', 'hhamilton43@technorati.com', 129, 1, 1, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Raymond Gomez', 'Philip', 'Moreno', 'rgomez44@webmd.com', 16, 1, 1, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Adam Hart', 'Kathleen', 'Fields', 'ahart45@sakura.ne.jp', 117, 2, 1, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Deborah Garrett', 'Russell', 'Mcdonald', 'dgarrett46@nbcnews.com', 59, 2, 0, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Sarah Jenkins', 'Nicole', 'Moreno', 'sjenkins47@mapquest.com', 49, 2, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Albert Mills', 'Richard', 'Wallace', 'amills48@eventbrite.com', 168, 1, 1, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jack Carr', 'Carolyn', 'Mcdonald', 'jcarr49@myspace.com', 25, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kevin Armstrong', 'Scott', 'Parker', 'karmstrong4a@unblog.fr', 72, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lillian Howell', 'Wanda', 'Larson', 'lhowell4b@tamu.edu', 1, 1, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Howard Lynch', 'William', 'Boyd', 'hlynch4c@uol.com.br', 37, 1, 1, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Alan Hill', 'Judy', 'Robertson', 'ahill4d@seesaa.net', 51, 1, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Jean Bailey', 'Jean', 'Riley', 'jbailey4e@blogger.com', 151, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Louis Duncan', 'Alan', 'Murray', 'lduncan4f@engadget.com', 27, 1, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Gerald Tucker', 'Christina', 'Ortiz', 'gtucker4g@ucsd.edu', 158, 1, 0, 2, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Nicholas Cook', 'Margaret', 'Carter', 'ncook4h@example.com', 14, 1, 1, 1, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Theresa Rice', 'Sharon', 'George', 'trice4i@i2i.jp', 3, 1, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Robert Hicks', 'Deborah', 'Gordon', 'rhicks4j@constantcontact.com', 37, 2, 1, 2, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rose Moreno', 'Shirley', 'Mcdonald', 'rmoreno4k@freewebs.com', 128, 2, 1, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Thomas Oliver', 'Catherine', 'Snyder', 'toliver4l@buzzfeed.com', 114, 2, 1, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Amanda Richards', 'Marilyn', 'Reynolds', 'arichards4m@bandcamp.com', 72, 1, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Phillip Fowler', 'Jonathan', 'Gilbert', 'pfowler4n@bloomberg.com', 118, 2, 1, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Amanda Watson', 'Rachel', 'Hayes', 'awatson4o@salon.com', 75, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('William Andrews', 'Ruby', 'Cooper', 'wandrews4p@csmonitor.com', 155, 2, 0, 1, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ruby Perez', 'Nancy', 'Stevens', 'rperez4q@barnesandnoble.com', 170, 1, 0, 1, 'Noob', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Johnny Johnston', 'Ruth', 'Dixon', 'jjohnston4r@bluehost.com', 135, 2, 1, 1, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Donna Kennedy', 'Jason', 'Robinson', 'dkennedy4s@amazon.co.uk', 119, 1, 1, 1, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Phyllis Ellis', 'Ashley', 'Howard', 'pellis4t@tuttocitta.it', 43, 1, 0, 2, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Patrick Ellis', 'Anthony', 'George', 'pellis4u@goodreads.com', 22, 2, 1, 2, 'Noob', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Susan Boyd', 'Louise', 'Morris', 'sboyd4v@upenn.edu', 5, 1, 0, 1, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Frank Jacobs', 'Howard', 'Powell', 'fjacobs4w@smugmug.com', 95, 1, 0, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Debra George', 'Irene', 'Lynch', 'dgeorge4x@mac.com', 52, 2, 0, 2, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Thomas Bryant', 'Barbara', 'Diaz', 'tbryant4y@nifty.com', 100, 2, 0, 2, 'Noob', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Aaron Scott', 'Cynthia', 'White', 'ascott4z@un.org', 161, 1, 0, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Paul Bell', 'Daniel', 'Wood', 'pbell50@clickbank.net', 90, 2, 0, 2, 'Senior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Christine Thomas', 'David', 'Richards', 'cthomas51@globo.com', 114, 2, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Christine Nichols', 'Ralph', 'Freeman', 'cnichols52@nasa.gov', 44, 2, 1, 2, 'Junior', 1, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kelly Nichols', 'Kelly', 'Ramirez', 'knichols53@tinyurl.com', 187, 1, 0, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Lisa Sullivan', 'Jennifer', 'Nguyen', 'lsullivan54@irs.gov', 138, 1, 0, 2, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Chris Gomez', 'Henry', 'Peterson', 'cgomez55@paypal.com', 63, 2, 1, 2, 'Senior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Bonnie Larson', 'David', 'Richards', 'blarson56@seattletimes.com', 90, 1, 1, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Donna Clark', 'Thomas', 'Hudson', 'dclark57@cyberchimps.com', 21, 1, 1, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Russell Murray', 'Theresa', 'West', 'rmurray58@digg.com', 153, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Ronald Taylor', 'Shawn', 'Elliott', 'rtaylor59@ovh.net', 139, 2, 1, 1, 'Noob', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kathryn Williams', 'Joan', 'Patterson', 'kwilliams5a@nature.com', 129, 2, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Billy Rice', 'Louise', 'Torres', 'brice5b@stanford.edu', 149, 1, 1, 1, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Robin Rodriguez', 'Lori', 'Franklin', 'rrodriguez5c@sphinn.com', 69, 1, 1, 1, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Irene Peters', 'Victor', 'Thomas', 'ipeters5d@ameblo.jp', 98, 1, 1, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Nicholas Stone', 'Scott', 'Kelley', 'nstone5e@cyberchimps.com', 56, 2, 1, 1, 'Junior', 0, 0);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Angela Hernandez', 'Deborah', 'Martinez', 'ahernandez5f@accuweather.com', 116, 1, 0, 1, 'Junior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Rose Kelly', 'Carolyn', 'Murphy', 'rkelly5g@newsvine.com', 76, 1, 1, 2, 'Junior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Douglas Harper', 'Gerald', 'Gordon', 'dharper5h@hostgator.com', 107, 1, 0, 1, 'Senior', 1, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Louise Tucker', 'Anna', 'Weaver', 'ltucker5i@plala.or.jp', 8, 2, 0, 2, 'Senior', 0, 1);
insert into Users (username, firstname, lastname, email, fkaddress, fkrole, invitation, fkstatus, name, active, valid) values ('Kathleen Gonzalez', 'Lillian', 'Kelly', 'kgonzalez5j@friendfeed.com', 161, 2, 1, 1, 'Senior', 0, 1);

insert into courts (name, consultationdays) values ('court 1',7);
insert into courts (name, consultationdays) values ('court 2',3);

use bi_project

CREATE TABLE "WineReviewsDataSet" (
    "Id" int,
    "country" varchar(max),
    "description" varchar(max),
    "designation" varchar(max),
    "points" int,
    "price" int,
    "province" varchar(max),
    "region_1" varchar(max),
    "region_2" varchar(max),
    "taster_name" varchar(max),
    "taster_twitter_handle" varchar(max),
    "title" varchar(max),
    "variety" varchar(max),
    "winery" varchar(max),
    "date" datetime
)

CREATE TABLE CountriesContinents (
    "Continent" varchar(max),
    "Country" varchar(max),
)

CREATE TABLE ReviewerDim (
    ReviewerId int identity(1,1),
primary key(reviewerid),
 
    [taster_name] varchar(max),
    [taster_twitter_handle] varchar(max),
)

CREATE TABLE LocationDim (
    LocationId int identity(1,1),
primary key(locationid),
    [country] varchar(max),
    [province] varchar(max),
    [region] varchar(max),
continent varchar(max)
)

CREATE TABLE WineDim (
    WineId int identity(1,1),
primary key(wineid),
    [description] varchar(max),
    [designation] varchar(max),
  
    [variety] varchar(max),
    [winery] varchar(max)
)


CREATE TABLE	[dbo].[DimDate]
	(	[DateKey] INT primary key, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[DayOfWeekInYear] VARCHAR(2),
		[DayOfQuarter] VARCHAR(3),
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,-- Flag 1=National Holiday, 0-No National Holiday
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
	)


create table Facts
(
	WineId int not null,
	ReviewerId int not null,
	ReviewId int not null,
	LocationId int not null,
	DateId int not null,
	Points int,
	NumberOfReviews int,
	Price int
)


create view LocationDimSmallerStrings
as
select LocationId,cast(country as varchar(1000)) as country,cast(province as varchar(1000)) as province,cast(region as varchar(1000)) as region
from LocationDim


alter view ReviewerDimSmallerStrings
as
select ReviewerId,cast(taster_name as varchar(100)) as taster_name
from ReviewerDim

create view WineDimSmallerStrings
as
select WineId,cast(description as varchar(2000)) as description,cast(designation as varchar(100)) as designation,cast(variety as varchar(100)) as variety,cast(winery as varchar(1000)) as winery
from WineDim
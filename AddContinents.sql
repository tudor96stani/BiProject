USE [bi_project]
GO
/****** Object:  StoredProcedure [dbo].[AddContinents]    Script Date: 5/18/2018 6:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[AddContinents]
as 
begin
	update locationdim  set continent = iq.Continent
	from 
		(
		select locationid,cc.continent
		from LocationDim ld
		inner join CountriesContinents cc on cc.Country = ld.country
		) iq
	where LocationDim.LocationId=iq.LocationId
end

USE [bi_project]
GO
/****** Object:  StoredProcedure [dbo].[ModifyPrices]    Script Date: 5/18/2018 7:00:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[ModifyPrices]
as
begin
	update WineReviewsDataSet
	set Price = rand()*(3300-4)+4
end